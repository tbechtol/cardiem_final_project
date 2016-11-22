class ServiceRequestsController < ApplicationController
  def index
    @service_requests = ServiceRequest.all

    render("service_requests/index.html.erb")
  end

  def show
    @service_request = ServiceRequest.find(params[:id])

    render("service_requests/show.html.erb")
  end

  def new
    @service_request = ServiceRequest.new

    render("service_requests/new.html.erb")
  end

  def create
    @service_request = ServiceRequest.new

    @service_request.car_id = params[:car_id]
    @service_request.rc_phone = params[:rc_phone]
    @service_request.driver_id = params[:driver_id]
    @service_request.repair_center_location = params[:repair_center_location]
    @service_request.pickup_location = params[:pickup_location]
    @service_request.pickup_time = params[:pickup_time]
    @service_request.pickup_date = params[:pickup_date]
    @service_request.rc_name = params[:rc_name]

    save_status = @service_request.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/service_requests/new", "/create_service_request"
        redirect_to("/service_requests")
      else
        redirect_back(:fallback_location => "/", :notice => "Service request created successfully.")
      end
    else
      render("service_requests/new.html.erb")
    end
  end

  def edit
    @service_request = ServiceRequest.find(params[:id])

    render("service_requests/edit.html.erb")
  end

  def update
    @service_request = ServiceRequest.find(params[:id])

    @service_request.car_id = params[:car_id]
    @service_request.rc_phone = params[:rc_phone]
    @service_request.driver_id = params[:driver_id]
    @service_request.repair_center_location = params[:repair_center_location]
    @service_request.pickup_location = params[:pickup_location]
    @service_request.pickup_time = params[:pickup_time]
    @service_request.pickup_date = params[:pickup_date]
    @service_request.rc_name = params[:rc_name]

    save_status = @service_request.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/service_requests/#{@service_request.id}/edit", "/update_service_request"
        redirect_to("/service_requests/#{@service_request.id}", :notice => "Service request updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Service request updated successfully.")
      end
    else
      render("service_requests/edit.html.erb")
    end
  end

  def destroy
    @service_request = ServiceRequest.find(params[:id])

    @service_request.destroy

    if URI(request.referer).path == "/service_requests/#{@service_request.id}"
      redirect_to("/", :notice => "Service request deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Service request deleted.")
    end
  end
end
