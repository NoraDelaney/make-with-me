class SearchesController < ApplicationController

  def index
    if params[:q] == ''
      flash[:alert] = 'Please specify a search phrase.'
      redirect_to users_path
    end
    if params[:q].present?
      @users = User.search(params[:q]).page params[:page]
      if @users.empty?
        flash[:notice] = 'Sorry, there were no matches.'
        redirect_to users_path
      else
        flash.now[:notice] = 'Check out your search matches below!'
      end
    else
      @users = User.all
    end
  end
end
