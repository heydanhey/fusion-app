Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/players' => 'players#index'
      post '/rosters' => 'rosters#create'
    end
  end
  
  devise_for :users

  devise_scope :user do
   authenticated :user do
     root 'rosters#index', as: :authenticated_root
   end

   unauthenticated do
     root 'devise/registrations#new', as: :unauthenticated_root
   end
  end

  # root to: "rosters#index"
  get "/rosters" => "rosters#index"
  get "/rosters/new" => "rosters#new"
  post "/rosters" => "rosters#create"
  get "/rosters/:id" => "rosters#show"
  get "/rosters/:id/edit" => "rosters#edit"
  patch "/rosters/:id" => "rosters#update"
  delete "/rosters/:id" => "rosters#destroy"

  get "/players" => "players#index"
  get "/players/new" => "players#new"
  post "/players" => "players#create"
  get "/players/:id" => "players#show"
  get "/players/:id/edit" => "players#edit"
  patch "/players/:id" => "players#update"
  delete "/players/:id" => "players#destroy"

end
