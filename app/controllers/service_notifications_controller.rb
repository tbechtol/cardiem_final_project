class ServiceNotificationsController < ApplicationController
  def index
    @service_notifications = ServiceNotification.page(params[:page]).per(10)

    render("service_notifications/index.html.erb")
  end

  def show
    @service_notification = ServiceNotification.find(params[:id])

    render("service_notifications/show.html.erb")
  end

  def new
    @service_notification = ServiceNotification.new

    render("service_notifications/new.html.erb")
  end

  def create
    @service_notification = ServiceNotification.new

    @service_notification.service_request_id = params[:service_request_id]
    @service_notification.status = params[:status]

    save_status = @service_notification.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/service_notifications/new", "/create_service_notification"
        redirect_to("/service_notifications")
      else
        redirect_back(:fallback_location => "/", :notice => "Service notification created successfully.")
      end
    else
      render("service_notifications/new.html.erb")
    end
  end

  def edit
    @service_notification = ServiceNotification.find(params[:id])

    render("service_notifications/edit.html.erb")
  end

  def update
    @service_notification = ServiceNotification.find(params[:id])

    @service_notification.service_request_id = params[:service_request_id]
    @service_notification.status = params[:status]

    save_status = @service_notification.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/service_notifications/#{@service_notification.id}/edit", "/update_service_notification"
        redirect_to("/service_notifications/#{@service_notification.id}", :notice => "Service notification updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Service notification updated successfully.")
      end
    else
      render("service_notifications/edit.html.erb")
    end
  end

  def destroy
    @service_notification = ServiceNotification.find(params[:id])

    @service_notification.destroy

    if URI(request.referer).path == "/service_notifications/#{@service_notification.id}"
      redirect_to("/", :notice => "Service notification deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Service notification deleted.")
    end
  end
end
