Rails.application.routes.draw do

  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resource :categories, except: [:show, :destroy]
    resource :category, except: [:show, :destroy]
    
    resource :admins, except: [:show, :destroy]
    resource :admin, except: [:show, :destroy]

    get 'dashboard', to: 'dashboard#index'
    get 'categories', to: 'categories#index'
    get 'admins', to: 'admins#index'
  end

  namespace :site do
    get 'home', to: 'home#index'

    namespace :profile do
      resource :dashboard, only: [:index]
    end
  end

  devise_for :admins, :skip => [:registrations]
  devise_for :members

  root 'site/home#index'
end
