class UsersController < ApplicationController
  def index
    if params[:q] == ''
      flash.now[:alert] = 'Please specify a search phrase.'
    end
    if params[:q].present?
      @users = User.search(params[:q])
      if @users.empty?
        flash.now[:alert] = 'Sorry, there were no matches.'
      else
        flash.now[:alert] = 'Check out your filtered matches below!'
      end
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
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

  private

  def user_params
    params.require(:user).permit(
      :email, :encrypted_password, :username, :first_name, :last_name,
      :description, :city, :state, :website,
    )
  end
end