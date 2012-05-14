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
end
