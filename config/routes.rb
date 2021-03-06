#look at merge
Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get '/customers/find',     to: 'customers#find'
      get '/customers/find_all', to: 'customers#find_all'
      get '/customers/random',   to: 'customers#random'

      get '/customers/:id/favorite_merchant', to: 'customers#favorite_merchant'

      resources :customers, except: [:edit, :new] do
        get '/invoices',     to: "customers/invoices#index"
        get '/transactions', to: "customers/transactions#index"
      end

      get '/merchants/find',         to: 'merchants#find'
      get '/merchants/find_all',     to: 'merchants#find_all'
      get '/merchants/random',       to: 'merchants#random'
      get '/merchants/most_revenue', to: 'merchants#most_revenue'
      get '/merchants/most_items',   to: 'merchants#most_items'
      get '/merchants/revenue',      to: 'merchants#revenue'

      get '/merchants/:id/revenue',                          to: 'merchants#show_revenue'
      get '/merchants/:id/favorite_customer',                to: 'merchants#favorite_customer'
      get '/merchants/:id/customers_with_pending_invoices',  to: 'merchants#customers_with_pending_invoices'

      resources :merchants, except: [:edit, :new] do
        get '/items',    to: "merchants/items#index"
        get '/invoices', to: "merchants/invoices#index"
      end

      get '/items/find',     to: 'items#find'
      get '/items/find_all', to: 'items#find_all'
      get '/items/random',   to: 'items#random'

      get '/items/most_revenue', to: 'items#most_revenue'
      get '/items/most_items',   to: 'items#most_items'
      get '/items/:id/best_day', to: 'items#best_day'

      resources :items, except: [:edit, :new] do
        get '/invoice_items', to: "items/invoice_items#index"
        get '/merchant',      to: "items/merchants#show"
      end

      get '/invoice_items/find',     to: 'invoice_items#find'
      get '/invoice_items/find_all', to: 'invoice_items#find_all'
      get '/invoice_items/random',   to: 'invoice_items#random'

      resources :invoice_items, except: [:edit, :new] do
        get '/invoice', to: 'invoice_items/invoices#show'
        get '/item',    to: 'invoice_items/items#show'
      end

      get '/invoices/find',     to: 'invoices#find'
      get '/invoices/find_all', to: 'invoices#find_all'
      get '/invoices/random',   to: 'invoices#random'

      resources :invoices, except: [:edit, :new] do
        get '/customer',      to: "invoices/customers#show"
        get '/merchant',      to: "invoices/merchants#show"
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
