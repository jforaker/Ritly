Ritly::Application.routes.draw do

  root 'urls#new'

  resources :urls , :only => [:new, :create, :show]

  get '/:hash_code', to: 'urls#show'
  get '/:hash_code/preview', to: 'urls#preview', :as => :preview  #:as sets the route path name

  
end
