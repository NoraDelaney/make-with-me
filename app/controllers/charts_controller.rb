class ChartsController < ApplicationController

  def index
    data = Array.new
    ArtType.all.each do |art_type|
      item = Hash.new
      item[:id] = art_type.id
      item[:name] = art_type.name
      item[:y] = art_type.users.count
      data << item
    end

    respond_to do |format|
      format.html
      format.json do render json: data
      end
    end
  end

end
