class UsersController < ApplicationController
  def index
    @users = User.order('last_name ASC').page params[:page]
  end

  def index
    @spots = Spot.search(params[:search]).order("last_name ASC")
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
      :first_name, :last_name, :description, :city, :state,
      :website, :artist_type_id
    )
  end
end
