Rails.application.routes.draw do
  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :categories, except: [:show, :destroy]

    resources :admins, except: [:show, :destroy]

    get 'dashboard', to: 'dashboard#index'
    get 'categories', to: 'categories#index'
    get 'admins', to: 'admins#index'
  end

  namespace :site do
    get 'home', to: 'home#index'

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: [:index]
    end
  end

  devise_for :admins, :skip => [:registrations]
  devise_for :members

  root 'site/home#index'
end
