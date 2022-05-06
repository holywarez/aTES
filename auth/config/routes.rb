Rails.application.routes.draw do
  devise_for :parrots, path: 'auth'#, only: [:sessions, :registrations]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :management do
    resources :parrots, except: [:new, :create]
  end

  get :token, to: 'token#obtain'
end
