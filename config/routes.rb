Rails.application.routes.draw do
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
