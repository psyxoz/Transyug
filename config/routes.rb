Transyug::Application.routes.draw do
  root :to => 'home#index'
  devise_for :users, :controllers => { :sessions => 'admin/sessions', :passwords => 'admin/passwords' }

  namespace :admin do
    match '/' => 'pages#show', :defaults => { :code => 'company' }
    match 'pages/:code' => 'pages#show', :as => :page

    resources :users, :partners
    resources :vessels do match :settings, :on => :collection end
    resources :jobs do match :settings, :on => :collection end

    match 'menus' => 'menus#index', :as => :menus
    match 'menus/update' => 'menus#update', :as => :menus_update
  end

  scope ':locale' do
    match '/' => 'home#index', :as => :root
    match 'pages/:code' => 'pages#show', :as => :page
    match 'pages/chartering/send' => 'pages#chartering_send', :as => :chartering_send
    match 'pages/technical_department/send' => 'pages#technical_department_send', :as => :technical_department_send
    match 'pages/crewing/send' => 'pages#crewing_send', :as => :crewing_send
    match 'application_form' => 'pages#application_form', :as => :application_form
    match 'pages/contacts/send' => 'pages#contacts_send', :as => :contacts_send
    match 'fleet' => 'fleet#index', :as => :fleet
    match 'fleet/:id' => 'fleet#show', :as => :fleet_show
    match 'vacancy' => 'jobs#index', :as => :jobs
    match 'vacancy_send' => 'jobs#send_resume', :as => :send_resume
    match 'partners' => 'partners#index', :as => :partners
  end

  mount Ckeditor::Engine => "/ckeditor"
end
