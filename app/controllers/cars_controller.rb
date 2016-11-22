class CarsController < ApplicationController
  before_action :current_user_must_be_car_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_car_user
    car = Car.find(params[:id])

    unless current_user == car.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @cars = current_user.cars.page(params[:page]).per(10)

    render("cars/index.html.erb")
  end

  def show
    @car = Car.find(params[:id])

    render("cars/show.html.erb")
  end

  def new
    @car = Car.new

    render("cars/new.html.erb")
  end

  def create
    @car = Car.new

    @car.user_id = params[:user_id]
    @car.make = params[:make]
    @car.model = params[:model]
    @car.year = params[:year]
    @car.mileage = params[:mileage]
    @car.service_history = params[:service_history]

    save_status = @car.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cars/new", "/create_car"
        redirect_to("/cars")
      else
        redirect_back(:fallback_location => "/", :notice => "Car created successfully.")
      end
    else
      render("cars/new.html.erb")
    end
  end

  def edit
    @car = Car.find(params[:id])

    render("cars/edit.html.erb")
  end

  def update
    @car = Car.find(params[:id])

    @car.user_id = params[:user_id]
    @car.make = params[:make]
    @car.model = params[:model]
    @car.year = params[:year]
    @car.mileage = params[:mileage]
    @car.service_history = params[:service_history]

    save_status = @car.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cars/#{@car.id}/edit", "/update_car"
        redirect_to("/cars/#{@car.id}", :notice => "Car updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Car updated successfully.")
      end
    else
      render("cars/edit.html.erb")
    end
  end

  def destroy
    @car = Car.find(params[:id])

    @car.destroy

    if URI(request.referer).path == "/cars/#{@car.id}"
      redirect_to("/", :notice => "Car deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Car deleted.")
    end
  end
end
