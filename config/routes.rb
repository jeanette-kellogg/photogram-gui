Rails.application.routes.draw do

get("/insert_user_record", { :controller => "users", :action => "add_user" })

get("/insert_photo_record", { :controller => "photos", :action => "add_photo" })

get("/", { :controller => "users", :action => "users" })
  
  get("/users", { :controller => "users", :action => "users" })
  
  get("/users/:any_username", { :controller => "users", :action => "details" })
  
  get("/photos", { :controller => "photos", :action => "photos" })
  
  get("/photos/:photo_id", { :controller => "photos", :action => "photo_page" })
  

end
