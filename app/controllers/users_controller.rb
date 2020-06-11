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

    user_id = @the_user.id
    user_photos = Photo.all.where({ :id => user_id})
    @photo_count = user_photos.count

    render({ :template => "pages/user_page"})
  end
end