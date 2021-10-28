Rails.application.routes.draw do
  get 'home/quotedraft'
  # get 'home/index'

root "home#index"
get "residential" => "home#residential"
get "commercial" => "home#commercial"
get "quote" => "home#quote"
get "quotedraft" => "home/quotedraft"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
