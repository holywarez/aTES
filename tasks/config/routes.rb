Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'auth', to: 'auth#check', as: 'check_auth'
  resources :tasks do
    collection do
      get :shuffle
    end

    get :resolve
  end

  root to: redirect('/tasks')
end
