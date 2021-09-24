Rails.application.routes.draw do
  resources :students
  devise_for :users, 
    controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match 'ping' => 'application#ping', via: :all
  match 'auth_ping' => 'application#auth_ping', via: :all
  match '/me' => 'application#me', via: :post

  match '/import_studios_overview' => 'studios#import_studios_overview', via: :get

  resources :wolves_comissions
  resources :accountings
  resources :alpha_teams
  resources :wolves
  resources :pit_crews
  resources :campaigns
  resources :rockets
  resources :gsheet
  get '/signup', to: 'leads#lead_signup'
  get '/studio_signup', to: 'studios#studio_signup'

  resources :leads
  resources :staffs
  resources :studios
  resources :studio_managers
  resources :studio_owners
  post '/lead_campaign', to: 'leads#lead_campaign'
end
