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

end
