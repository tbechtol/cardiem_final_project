class DriversController < ApplicationController
  def index
    @drivers = Driver.page(params[:page]).per(10)
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def new
    @driver = Driver.new

    render("drivers/new.html.erb")
  end

  def create
    @driver = Driver.new

    @driver.user_id = params[:user_id]
    @driver.first_name = params[:first_name]
    @driver.last_name = params[:last_name]
    save_status = @driver.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/drivers/new", "/create_driver"
        redirect_to("/drivers")
      else
        redirect_back(:fallback_location => "/", :notice => "Driver created successfully.")
      end
    else
      render("drivers/new.html.erb")
    end
  end

  def edit
    @driver = Driver.find(params[:id])

    render("drivers/edit.html.erb")
  end

  def update
    @driver = Driver.find(params[:id])

    @driver.user_id = params[:user_id]
    @driver.first_name = params[:first_name]
    @driver.last_name = params[:last_name]
    save_status = @driver.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/drivers/#{@driver.id}/edit", "/update_driver"
        redirect_to("/drivers/#{@driver.id}", :notice => "Driver updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Driver updated successfully.")
      end
    else
      render("drivers/edit.html.erb")
    end
  end

end
