Rails.application.routes.draw do
  
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"

  get("/login", { :controller => "sessions", :action => "new" })
  get("/logout", { :controller => "sessions", :action => "destroy" })

  get("/", { :controller => "places", :action => "index" })

end
