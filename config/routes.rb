Rails.application.routes.draw do
  # get 'home/index'


get "home/login"
root "home#index"
get "residential" => "home#residential"
get "commercial" => "home#commercial"
get "quote" => "home#quote"

# why is this different from Arman? -jake

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
