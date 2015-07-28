Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/customers/find', to: 'customers#find'
      get '/customers/find_all', to: 'customers#find_all'
      get '/customers/random', to: 'customers#random'
      resources :customers, except: [:edit, :new]

      get '/merchants/find', to: 'merchants#find'
      get '/merchants/find_all', to: 'merchants#find_all'
      get '/merchants/random', to: 'merchants#random'
      resources :merchants, except: [:edit, :new] do
        get '/items', to: "merchants/items#index"
        get '/invoices', to: "merchants/invoices#index"
      end

      get '/items/find', to: 'items#find'
      get '/items/find_all', to: 'items#find_all'
      get '/items/random', to: 'items#random'
      resources :items, except: [:edit, :new] do
        get '/invoice_items', to: "items/invoice_items#index"
        get '/merchant', to: "items/merchants#index"
      end

      get '/invoice_items/find', to: 'invoice_items#find'
      get '/invoice_items/find_all', to: 'invoice_items#find_all'
      get '/invoice_items/random', to: 'invoice_items#random'
      resources :invoice_items, except: [:edit, :new] do
        get '/invoice', to: 'invoice_items/invoices#index'
        get '/item',    to: 'invoice_items/items#index'
      end

      get '/invoices/find', to: 'invoices#find'
      get '/invoices/find_all', to: 'invoices#find_all'
      get '/invoices/random', to: 'invoices#random'
      resources :invoices, except: [:edit, :new] do
        get '/customer',      to: "invoices/customers#index"
        get '/merchant',      to: "invoices/merchants#index"
        get '/items',         to: "invoices/items#index"
        get '/invoice_items', to: "invoices/invoice_items#index"
        get '/transactions',  to: "invoices/transactions#index"
      end

      resources :transactions, except: [:edit, :new] do
        get '/invoice', to: "transactions/invoices#show"
      end
    end
  end
end
