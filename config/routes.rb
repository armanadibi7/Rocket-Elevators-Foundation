Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # get 'home/index'

#devise_for :users
#resources: quotes
get "home/login"
root to: "home#index"
get "residential" => "home#residential"
get "commercial" => "home#commercial"
get "quote" => "home#quote"
post "getData" => "quote#getData"

 


# why is this different from Arman? -jake

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
