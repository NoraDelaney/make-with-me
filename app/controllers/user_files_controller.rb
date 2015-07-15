def new
  @user = User.find params[:user_id]
  @user_file = UserFile.new
end

def create
  @user = User.find(params[:user_id])
  @user_file = UserFile.new(review_params)
  @user_file.user = current_user
  @user_file.user_id = @user.id
  if @user_file.save
    flash[:success] = "Review added"
    redirect_to user_path(@user)
  else
    flash[:alert] = @user_file.errors.full_messages.join(".  ")
    render :new
  end
end

def user_file_params
  params.require(:user).permit(:user_file, :user_id)
end
