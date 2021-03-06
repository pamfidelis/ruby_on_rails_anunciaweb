Rails.application.routes.draw do
  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    get 'dashboard', to: 'dashboard#index'
    get 'categories', to: 'categories#index'
    get 'admins', to: 'admins#index'

    resources :categories, except: [:show, :destroy]
    resources :admins, except: [:show, :destroy]
    resources :diagrams, only: [:index]
  end

  namespace :site do
    get 'home', to: 'home#index'
    get 'search', to: 'search#ads'

    resources :ad_details, only: [:show]
    resources :categories, only: [:show]
    resources :comments

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: [:index, :edit, :update, :new, :create]
    end
  end

  devise_for :admins, :skip => [:registrations]
  devise_for :members, controllers: { sessions: 'members/sessions' }

  root 'site/home#index'
end
