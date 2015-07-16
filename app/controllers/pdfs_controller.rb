class PdfsController < ApplicationController
  def new
    @user = User.find params[:user_id]
    @pdf = Pdf.new
  end

  def create
    @user = User.find(params[:user_id])
    @pdf = Pdf.new(pdf_params)
    @pdf.user = current_user
    @pdf.user_id = @user.id
    if @pdf.save
      flash[:success] = "PDF added"
      redirect_to user_path(@user)
    else
      flash[:alert] = @pdf.errors.full_messages.join(".  ")
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @pdf = Pdf.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @pdf = Pdf.find(params[:id])
    if (current_user && current_user.id == @pdf.user_id) ||
        (current_user && current_user.admin?)
      if @pdf.update(user_file_params)
        flash[:success] = "File updated"
        redirect_to user_path(@user)
      else
        flash[:alert] = @pdf.errors.full_messages.join(".  ")
        render :edit
      end
    else
      flash[:alert] = "You don't have permission to edit that file."
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @pdf = Pdf.find(params[:id])
    if (current_user && current_user.id == @pdf.user_id) ||
        (current_user && current_user.admin?)
      @pdf.destroy
      flash[:notice] = "File deleted"
      redirect_to user_path(@user)
    else
      flash[:alert] = "You don't have permission to delete that user file."
      redirect_to user_path(@user)
    end
  end

  def pdf_params
    params.require(:pdf).permit(:name, :user_pdf, :user_id)
  end
end
