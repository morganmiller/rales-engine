Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/customers/find', to: 'customers#find'
      get 'customers/find_all', to: 'customers#find_all'
      resources :customers, except: [:edit, :new]
    end
  end
end
