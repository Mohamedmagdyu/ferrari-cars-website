class FerrariCarsController < ApplicationController

  def index
    @ferrari_cars = FerrariCar.includes(:category).available.by_year.page(params[:page]).per(12)
    @categories = Category.ordered
    
    # Filter by category if provided
    if params[:category_id].present?
      @ferrari_cars = @ferrari_cars.where(category_id: params[:category_id])
    end
    
    # Search by name or model
    if params[:search].present?
      @ferrari_cars = @ferrari_cars.where("name ILIKE ? OR model ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end
  end

  def show
    @ferrari_car = FerrariCar.friendly.find(params[:id])
    @related_cars = FerrariCar.where(category_id: @ferrari_car.category_id)
                               .where.not(id: @ferrari_car.id)
                               .available
                               .limit(3)
  end

  private
  # Write your private methods here
end
