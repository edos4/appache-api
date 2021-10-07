Rails.application.routes.draw do

  devise_scope :user do 
    match '/reset', to: 'users/passwords#reset', via: :post
  end

  devise_for :users, 
    controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match 'ping' => 'application#ping', via: :all
  match 'auth_ping' => 'application#auth_ping', via: :all
  match '/me' => 'application#me', via: :post

  #staff
  match '/import_team' => 'staffs#import_team', via: :get

  #studios
  match '/import_studios_overview' => 'studios#import_studios_overview', via: :get

  #leads
  match '/import_studios_overview' => 'studios#import_studios_overview', via: :get
  get '/signup', to: 'leads#lead_signup'
  post '/lead_campaign', to: 'leads#lead_campaign'
  post '/leads/bulk_delete', to: 'leads#bulk_delete'

  resources :wolves_comissions
  resources :accountings
  resources :alpha_teams
  resources :wolves
  resources :pit_crews
  resources :campaigns do
    member do
      get :leads
    end
  end
  resources :rockets
  resources :gsheet
  get '/studio_signup', to: 'studios#studio_signup'

  resources :leads
  resources :staffs
  resources :studios
  resources :studio_managers
  resources :studio_owners
  
end
