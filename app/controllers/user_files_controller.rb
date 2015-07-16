class UserFilesController < ApplicationController
  def new
    @user = User.find params[:user_id]
    @user_file = UserFile.new
  end

  def create
    @user = User.find(params[:user_id])
    @user_file = UserFile.new(user_file_params)
    @user_file.user = current_user
    @user_file.user_id = @user.id
    if @user_file.save
      flash[:success] = "File added"
      redirect_to user_path(@user)
    else
      flash[:alert] = @user_file.errors.full_messages.join(".  ")
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @user_file = UserFile.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @user_file = UserFile.find(params[:id])
    if (current_user && current_user.id == @user_file.user_id) ||
        (current_user && current_user.admin?)
      if @user_file.update(user_file_params)
        flash[:success] = "File updated"
        redirect_to user_path(@user)
      else
        flash[:alert] = @user_file.errors.full_messages.join(".  ")
        render :edit
      end
    else
      flash[:alert] = "You don't have permission to edit that file."
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @user_file = UserFile.find(params[:id])
    if (current_user && current_user.id == @user_file.user_id) ||
        (current_user && current_user.admin?)
      @user_file.destroy
      flash[:notice] = "File deleted"
      redirect_to user_path(@user)
    else
      flash[:alert] = "You don't have permission to delete that user file."
      redirect_to user_path(@user)
    end
  end

  def user_file_params
    params.require(:user_file).permit(:file, :user_id)
  end
end
