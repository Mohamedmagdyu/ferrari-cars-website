class Admin::FerrariCarsController < Admin::BaseController
  before_action :set_ferrari_car, only: [:show, :edit, :update, :destroy]

  def index
    @ferrari_cars = FerrariCar.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @ferrari_car = FerrariCar.new
  end

  def create
    @ferrari_car = FerrariCar.new(ferrari_car_params)

    if @ferrari_car.save
      redirect_to admin_ferrari_car_path(@ferrari_car), notice: 'Ferrari car was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @ferrari_car.update(ferrari_car_params)
      redirect_to admin_ferrari_car_path(@ferrari_car), notice: 'Ferrari car was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ferrari_car.destroy
    redirect_to admin_ferrari_cars_path, notice: 'Ferrari car was successfully deleted.'
  end

  private

  def set_ferrari_car
    @ferrari_car = FerrariCar.find(params[:id])
  end

  def ferrari_car_params
    params.require(:ferrari_car).permit(:name, :model, :year, :price, :description, :engine, :top_speed, :acceleration, :status, :slug, :category_id, :image)
  end
end
