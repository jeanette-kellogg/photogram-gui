class PhotosController < ApplicationController
  

def add_photo
  #Params :"input_image"=>"asfd", "input_caption"=>"asfadsf", "input_owner_id"=>"asdfasdf"

    new_url = params.fetch("input_image")
    new_caption = params.fetch("input_caption")
    new_owner = params.fetch("input_owner_id")

    @photo = Photo.new
    @photo.image = new_url
    @photo.caption = new_caption
    @photo.owner_id = new_owner
    @photo.save

    photos_list = Photo.all.order(:created_at	=> :desc) 
    @new_id = photos_list.at(0).id.to_s

    details_path = "/photos/" + @new_id
    redirect_to(details_path)

end

  def photos
    @all_images = Photo.all.order({ :created_at => :desc})
    render({ :template => "pages/photos"})
  end


def photo_page
  # Parameters: :photo_id => "177"
    p_id = params.fetch("photo_id")
    imagematch = Photo.where({ :id => :p_id})
    the_photo = imagematch.at(0)
    
   render({ :template => "pages/photo_page"})
  end


end
