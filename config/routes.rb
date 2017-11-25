Rails.application.routes.draw do
  # Routes for the Response resource:
  # CREATE
  get "/responses/new", :controller => "responses", :action => "new"
  post "/create_response", :controller => "responses", :action => "create"

  # READ
  get "/responses", :controller => "responses", :action => "index"
  get "/responses/:id", :controller => "responses", :action => "show"

  # UPDATE
  get "/responses/:id/edit", :controller => "responses", :action => "edit"
  post "/update_response/:id", :controller => "responses", :action => "update"

  # DELETE
  get "/delete_response/:id", :controller => "responses", :action => "destroy"
  #------------------------------

  # Routes for the Assigned_prompt resource:
  # CREATE
  get "/assigned_prompts/new", :controller => "assigned_prompts", :action => "new"
  post "/create_assigned_prompt", :controller => "assigned_prompts", :action => "create"

  # READ
  get "/assigned_prompts", :controller => "assigned_prompts", :action => "index"
  get "/assigned_prompts/:id", :controller => "assigned_prompts", :action => "show"

  # UPDATE
  get "/assigned_prompts/:id/edit", :controller => "assigned_prompts", :action => "edit"
  post "/update_assigned_prompt/:id", :controller => "assigned_prompts", :action => "update"

  # DELETE
  get "/delete_assigned_prompt/:id", :controller => "assigned_prompts", :action => "destroy"
  #------------------------------

  devise_for :instructors
  # Routes for the Instructor resource:
  # READ
  get "/instructors", :controller => "instructors", :action => "index"
  get "/instructors/:id", :controller => "instructors", :action => "show"


  # Routes for the Prompt resource:
  # CREATE
  get "/prompts/new", :controller => "prompts", :action => "new"
  post "/create_prompt", :controller => "prompts", :action => "create"

  # READ
  get "/prompts", :controller => "prompts", :action => "index"
  get "/prompts/:id", :controller => "prompts", :action => "show"

  # UPDATE
  get "/prompts/:id/edit", :controller => "prompts", :action => "edit"
  post "/update_prompt/:id", :controller => "prompts", :action => "update"

  # DELETE
  get "/delete_prompt/:id", :controller => "prompts", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
