class Admins::TownsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @towns = Town.all
    @town = Town.new
  end
  
  def create
    @town = Town.new(town_params)
    if @town.save
      redirect_to admins_towns_path
    end
  end
  
  def edit
    @town = Town.find(params[:id])
  end
  
  def update
    @town = Town.find(params[:id])
    if @town.update(town_params)
      redirect_to admins_towns_path
    else
      render :edit
    end  
  end
  
  def destroy
    @town = Town.find(params[:id])
    @town.destroy
    redirect_to admins_towns_path
  end
  
  private
  
  def town_params
    params.require(:town).permit(:name)    
  end
  
end