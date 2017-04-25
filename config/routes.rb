Rails.application.routes.draw do

  get("/photos/:the_id_number", {:controller => "photos", :action => "show"})

  get("/photos", {:controller => "photos", :action => "index"})
  #the fact that the URL is /photos is all up to us, and just a coincidence that it matches up wtih render view

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
