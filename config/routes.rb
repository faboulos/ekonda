Rails.application.routes.draw do
 
  devise_for :users,
  :path => '', 
  :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  :controllers=>{:registrations=> 'registrations', 
                :confirmations=> 'confirmations'}

# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
root 'pages#home'

resources :users, only: [:show]
resources :rooms,  path: 'annonces' do 
resources :reservations, only: [:create]
resources :reviews, only: [:create, :destroy]
end
resources :photos
resources :conversations, only: [:index, :create] do
  resources :messages, only: [:index, :create]
end


get 'your_trips' => 'reservations#your_trips'
get 'your_reservations' => 'reservations#your_reservations'

get '/preload' => 'reservations#preload'
get '/preview' => 'reservations#preview'

get '/search' => 'pages#search'



end
