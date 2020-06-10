class UsersController < ApplicationController

def add_user

  render ({ :template => "pages/createuser.html.erb"})
end
  
  def users
    @all_users = User.all.order({ :username => :asc})
    render({ :template => "pages/users"})
  end

def details
  # Parameters: :any_username => "name"
    the_un = params.fetch("any_username")
    match = User.where({ :username => the_un})
    @the_user = match.at(0)

    user_id = @the_user.id
    user_photos = Photo.all.where({ :id => user_id})
    @photo_count = user_photos.count

    render({ :template => "pages/user_page"})
  end
end