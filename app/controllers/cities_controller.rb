class CitiesController < ApplicationController

  def show
    @city = City.find(params[:id])
    @gossips = City.find(params[:id]).gossips.order('updated_at DESC')
  end

end
