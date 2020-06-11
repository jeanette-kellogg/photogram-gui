class PhotosController < ApplicationController
  
def add_comment

#Params: "input_photo_id"=>"777", "input_author_id"=>"33", "input_body"=>"adsfdsaf", "controller"=>"photos", "action"=>"add_comment"}

  comment_photo = params.fetch("input_photo_id")
  comment_author_id = params.fetch("input_author_id")
  comment_body = params.fetch("input_body")

  @c = Comment.new
  @c.photo_id = comment_photo
  @c.body = comment_author_id
  @c.author_id = comment_body

 @c.save

 # @c_id = @c.id
  details_path = "/photos" 
  redirect_to(details_path)
end


def add_photo
  #Params :"input_image"=>"asfd", "input_caption"=>"asfadsf", "input_owner_id"=>"asdfasdf"

    new_url = params.fetch("input_image")
    new_caption = params.fetch("input_caption")
    new_owner = params.fetch("input_owner_id")

    p = Photo.new
    p.image = new_url
    p.caption = new_caption
    p.owner_id = new_owner
    p.save

  details_path = "/photos/77" 
  redirect_to(details_path)

end

  def photos
    @all_images = Photo.all.order({ :created_at => :desc})
    render({ :template => "pages/photos"})
  end


def photo_page
  # Parameters: :photo_id => "177"
  
    id_num = params.fetch("photo_id")
    match = Photo.where({ :id => id_num})
    @the_photo = match.at(0)
    @image = @the_photo.image
    @caption = @the_photo.caption
    @owner = @the_photo.owner_id
    @posted = @the_photo.created_at

    owner_match = User.where({ :id => @owner})
    @the_owner = owner_match.at(0)
    @owner_name = @the_owner.username

    @all_comments = Comment.where({ :photo_id => @the_photo.id})

   render({ :template => "pages/photo_page"})


  end


end
