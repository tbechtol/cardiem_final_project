Rails.application.routes.draw do
  root :to => "cars#index"
  # Routes for the Service_notification resource:
  # CREATE
  get "/service_notifications/new", :controller => "service_notifications", :action => "new"
  post "/create_service_notification", :controller => "service_notifications", :action => "create"

  # READ
  get "/service_notifications", :controller => "service_notifications", :action => "index"
  get "/service_notifications/:id", :controller => "service_notifications", :action => "show"

  # UPDATE
  get "/service_notifications/:id/edit", :controller => "service_notifications", :action => "edit"
  post "/update_service_notification/:id", :controller => "service_notifications", :action => "update"

  # DELETE
  get "/delete_service_notification/:id", :controller => "service_notifications", :action => "destroy"
  #------------------------------

  # Routes for the Service_request resource:
  # CREATE
  get "/service_requests/new", :controller => "service_requests", :action => "new"
  post "/create_service_request", :controller => "service_requests", :action => "create"

  # READ
  get "/service_requests", :controller => "service_requests", :action => "index"
  get "/service_requests/:id", :controller => "service_requests", :action => "show"

  # UPDATE
  get "/service_requests/:id/edit", :controller => "service_requests", :action => "edit"
  post "/update_service_request/:id", :controller => "service_requests", :action => "update"

  # DELETE
  get "/delete_service_request/:id", :controller => "service_requests", :action => "destroy"
  #------------------------------

  # Routes for the Car resource:
  # CREATE
  get "/cars/new", :controller => "cars", :action => "new"
  post "/create_car", :controller => "cars", :action => "create"

  # READ
  get "/cars", :controller => "cars", :action => "index"
  get "/cars/:id", :controller => "cars", :action => "show"

  # UPDATE
  get "/cars/:id/edit", :controller => "cars", :action => "edit"
  post "/update_car/:id", :controller => "cars", :action => "update"

  # DELETE
  get "/delete_car/:id", :controller => "cars", :action => "destroy"
  #------------------------------

  devise_for :drivers
  # Routes for the Driver resource:
  # READ
  get "/drivers", :controller => "drivers", :action => "index"
  get "/drivers/:id", :controller => "drivers", :action => "show"


  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
