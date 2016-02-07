Rails.application.routes.draw do

  get "/rosters" => "rosters#index"
  get "/rosters/new" => "rosters#new"
  post "/rosters" => "rosters#create"
  get "/rosters/:id" => "rosters#show"
  get "/rosters/:id/edit" => "rosters#edit"
  patch "/rosters/:id" => "rosters#update"
  delete "/rosters/:id" => "rosters#destroy"

end
