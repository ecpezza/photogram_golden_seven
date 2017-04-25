Rails.application.routes.draw do

  #create
  get("/photos/new", {:controller => "photos", :action => "new_form"})
  #must be above the id_number route (routes works top down)
  get("/create_photo", {:controller => "photos", :action => "create_row"})

  #READ
  get("/photos/:the_id_number", {:controller => "photos", :action => "show"})
  get("/photos", {:controller => "photos", :action => "index"})
  #the fact that the URL is /photos is all up to us, and just a coincidence that it matches up wtih render view

  #UPDATE
  get("/photos/:the_id/edit", {:controller => "photos", :action => "edit_form"})
get("/update_photo/:the_id", {:controller => "photos", :action => "update_row"})


  #DELETE

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
