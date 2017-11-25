Rails.application.routes.draw do
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
