class UsersController < ApplicationController
  def index
    if params[:q] == ''
      flash.now[:alert] = 'Please specify a search phrase.'
    end
    if params[:q].present?
      @users = User.search(params[:q])
      if @users.empty?
        flash.now[:notice] = 'Sorry, there were no matches.'
      else
        flash.now[:notice] = 'Check out your search matches below!'
      end
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
    @user_files = @user.user_files
    @pdfs = @user.pdfs
  end

  def edit
    @user = User.find(params[:id])
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User updated."
      redirect_to user_path(@user)
    else
      flash[:alert] = @user.errors.full_messages.join(".  ")
      render :edit
    end
  end

  def like
    @user = User.find(params[:id])
    @user.liked_by current_user
    if request.xhr?
      render json: {count: @user.get_likes.size, id: params[:id]}
    else
      redirect_to @user
    end
  end

  def dislike
    @user = User.find(params[:id])
    @user.disliked_by current_user

    if request.xhr?
      render json: {count: @user.get_likes.size, id: params[:id]}
    else
    redirect_to @user
    end
  end




  private

  def user_params
    params.require(:user).permit(
      :email, :encrypted_password, :username, :first_name, :last_name,
      :description, :city, :state, :website, :profile_photo
    )
  end
end
