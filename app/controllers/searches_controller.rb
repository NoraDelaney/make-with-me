class SearchesController < ApplicationController

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
end
