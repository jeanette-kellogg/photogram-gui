class PhotosController < ApplicationController
  

def add_photo

  render ({ :template => "pages/createphoto.html.erb"})
end

  def photos
    @all_images = Photo.all.order({ :created_at => :desc})
    render({ :template => "pages/photos"})
  end


def photo_page
  # Parameters: :photo_id => "177"
    the_id = params.fetch("photo_id")
    match = Photo.where({ :id => the_id})
    @the_user = match.at(0)

    user_id = @the_user.id
    user_photos = Photo.all.where({ :id => user_id})
    @photo_count = user_photos.count

   render({ :template => "pages/photo_page"})
  end


end
