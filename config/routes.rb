Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })
  get("/directors", { :controller => "misc", :action => "directors" })
  get("/directors/youngest", { :controller => "misc", :action => "directors_youngest" })
  get("/directors/eldest", { :controller => "misc", :action => "directors_eldest" })
  get "/directors/:id", to: "misc#show_director", as: "director"
  get("/movies", { :controller => "misc", :action => "movies" })
  get "/movies/:id", to: "misc#show_movie", as: "movie"
  get("/actors", { :controller => "misc", :action => "actors" })
  get "/actors/:id", to: "misc#show_actor", as: "actor"
end
