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
    get 'search', to: 'search#ads'

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: [:index, :edit, :update, :new, :create]
    end

    resources :ad_details, only: [:show]
    resources :categories, only: [:show]
  end

  devise_for :admins, :skip => [:registrations]
  devise_for :members, controllers: { sessions: 'members/sessions' }

  root 'site/home#index'
end
