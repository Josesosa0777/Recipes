Rails.application.routes.draw do
	root "pages#home"
    get 'pages/home', to: 'pages#home'
    get 'signup', to: 'chefs#new'
    resources :chefs, except: [:new]
    
    resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
