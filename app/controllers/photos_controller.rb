class PhotosController < ApplicationController

  def show
    #the params hash looks like this: {"the_id_number"=>"1"}
    id_number = params["the_id_number"]
    @photo = Photo.find(id_number)
  #  @the_caption = p.caption
  #  @the_image_url = p.source
  #  @created_at = p.created_at
    #find method if given a string will convert to integer because find's job is to use params
    render("photos/show.html.erb")
  end

  def index
    #@all_photos = Photo.all #this gets the whole table as an array
    @all_photos = Photo.all.order({:created_at => :desc })
    render("photos/index.html.erb")
  end

  def new_form
    render("photos/new_form.html.erb")
  end

  def create_row
    #render("photos/create_row.html.erb")
    #the params look like this: {"the_image_url"=>"", "the_caption"=>""}
    p = Photo.new
    p.source = params["the_image_url"]
    p.caption = params["the_caption"]
    p.save

    redirect_to("http://localhost:3000/photos") #or redirect_to("/photos")
  end

  def edit_form
    @the_photo_to_edit = Photo.find(params[:the_id])

    render("photos/edit_form.html.erb")
  end

  def update_row
    #from the server log, the params lookl like:   Parameters: {"the_source"=>"http://cdn.thedailybeast.com/content/dailybeast/articles/2017/04/03/the-internet-s-most-famous-pregnant-giraffe-still-hasn-t-given-birth/jcr:content/image.crop.800.500.jpg/49708403.cached.jpg", "the_caption"=>"giraffe", "the_id"=>"19"}
    p = Photo.find(params[:the_id])
    p.source = params["the_source"] #determined by the name of the input in the form
    p.caption = params["the_caption"]
    p.save

    redirect_to("/photos")
  end
end
