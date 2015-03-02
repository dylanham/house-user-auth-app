class HousesController < ApplicationController
  before_action :set_house, only:[:show, :edit, :update]

  def index
    @houses = House.all
  end

  def show
  end

  def new
    @house = House.new
  end

  def create
    house = House.new(house_params)
    if house.save
      flash[:notice] = "You created a new home!"
      redirect_to house_path(house)
    else
      @house = house
      render :new
    end
  end

  def edit
  end

  def update
    if @house.update(house_params)
      flash[:notice] = "You updated a new home!"
      redirect_to house_path(@house)
    else
      render :edit
    end
  end

  def destroy
    house = House.find(params[:id])
    house.destroy
    flash[:notice] = "Your house burned down!"
    redirect_to houses_path
  end

  private

  def house_params
    params.require(:house).permit(:name, :size)
  end

  def set_house
    @house = House.find(params[:id])
  end

end
