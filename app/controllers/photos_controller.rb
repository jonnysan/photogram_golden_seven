class PhotosController < ActionController::Base
  def new_form
    render("photos/new.html.erb")
  end
  def create_row
    p = Photo.new
    p.source = params["the_image_url"]
    p.caption = params["the_caption"]
    p.save



    # render("photos/create_row.html.erb")
    redirect_to("/photos")
  end
  def show

    p=Photo.find(params["the_id_number"])
    @the_caption = p.caption
    @the_image_url = p.source
    @created_at = p.created_at
    render("photos/show.html.erb")

  end
  def edit_form
    @photo_to_be_edited = Photo.find(params[:the_id])
    render("photos/edit_form.html.erb")

  end
  def update_row
    p=Photo.find(params["the_id"])
    p.source = params["the_source"]
    p.caption = params["the_caption"]
    p.save
    redirect_to("/photos")
  end
  def index
    @all_photos=Photo.order({:created_at => :desc})
    render("photos/index.html.erb")

  end
  # protect_from_forgery with: :exception
end
