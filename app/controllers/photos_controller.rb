class PhotosController < ApplicationController

  def show
    #the params hash looks like this: {"the_id_number"=>"1"}
    id_number = params["the_id_number"]
    p = Photo.find(id_number)
    @the_caption = p.caption
    @the_image_url = p.source
    @created_at = p.created_at
    #find method if given a string will convert to integer because find's job is to use params
    render("photos/show.html.erb")
  end

  def index
    @all_photos = Photo.all #this gets the whole table as an array
    render("photos/index.html.erb")
  end
end
