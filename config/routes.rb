Transyug::Application.routes.draw do
  root :to => 'home#index'
  devise_for :users, :controllers => { :sessions => 'admin/sessions', :passwords => 'admin/passwords' }

  namespace :admin do
    match '/' => 'pages#show', :defaults => { :code => 'company' }
    match 'pages/:code' => 'pages#show', :as => :page

    resources :users, :partners
    resources :vessels do match :settings, :on => :collection end
    resources :jobs do match :settings, :on => :collection end
  end

  scope ':locale' do
    match '/' => 'home#index', :as => :root
    match 'pages/:code' => 'pages#show', :as => :page
    match 'fleet' => 'fleet#index', :as => :fleet
    match 'fleet/:id' => 'fleet#show', :as => :fleet_show
    match 'vacancy' => 'jobs#index', :as => :jobs
    match 'partners' => 'partners#index', :as => :partners
  end

end
