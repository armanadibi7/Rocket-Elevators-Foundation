Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
 

get "home/login"
get 'getBuildings/:id', to: 'intervention#getBuildings'  
get 'getBattery/:id', to: 'intervention#getBattery'  
get 'getColumn/:id', to: 'intervention#getColumn'  
get 'getElevator/:id', to: 'intervention#getElevator'  
get 'getEmployee/:id', to: 'intervention#getEmployee'  
get "/" => "home#index", :as => "root"
post "/" , to: "home#create"
get "residential" => "home#residential"
get "commercial" => "home#commercial"
get "quote" => "home#quote"
post "getData" => "quote#getData"
get "intervention" => "home#intervention"
post "/intervention" => "intervention#submit"
get "voice" => "home#voice"
post "register" => "voice#register"

post "identify" => "voice#identify"
get 'checkAllStatus', to: 'voice#checkAllStatus'
get 'checkStatus/:id', to: 'voice#checkStatus'

get "transcribe" => "home#transcribe"
post "transcribe" => "voice#transcribe"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
