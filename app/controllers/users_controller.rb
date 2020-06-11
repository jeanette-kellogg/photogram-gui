class UsersController < ApplicationController

def add_row
  #Params :any_username=name

    new_user = params.fetch("any_username")
    
    @user = User.new
    @user.username = new_user
    @user.save

  details_path = "/users/" + @user.username
  redirect_to(details_path)

end
  
  def users
    @all_users = User.all.order({ :username => :asc})
    render({ :template => "pages/users"})
  end

def details
  # Parameters: :add_username => "name"
    the_un = params.fetch("any_username")
    match = User.where({ :username => the_un})
    @the_user = match.at(0)

  @all_user_photos = Photo.where({ :owner_id => @the_user.id})


    render({ :template => "pages/user_page"})

# Parameters: :photo_id => "177"
  
  #  id_num = params.fetch("photo_id")
  #  match = Photo.where({ :id => id_num})
  #  @the_photo = match.at(0)
  #  @image = @the_photo.image
   # @caption = @the_photo.caption
   # @owner = @the_photo.owner_id
   # @posted = @the_photo.created_at

  #  owner_match = User.where({ :id => @owner})
  #  @the_owner = owner_match.at(0)
   # @owner_name = @the_owner.username

#    @all_comments = Comment.where({ :photo_id => @the_photo.id})



  end
end