Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  get "/about", :controller => "static_pages", :action => "about"
  resources :games do
    member do
      patch :join
      put :join
    end
  end


end
