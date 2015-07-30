require 'rails_helper'

describe Api::V1::MerchantsController do
  context '#index' do
    it 'returns all the merchants' do
      get :index, format: :json

      expect(response).to have_http_status(:ok)
      merchants = JSON.parse(response.body)
      expect(merchants.count).to eq(3)

      merchant = merchants.last
      expect(merchant['name']).to eq('I sell spoons')
    end
  end

  context '#show' do
    it 'returns the requested merchant' do
      m = Merchant.create(name: 'i am a merchant')

      get :show, id: m.id, format: :json

      expect(response).to have_http_status(:ok)

      merchant = JSON.parse(response.body)
      expect(merchant['name']).to eq('i am a merchant')
    end
  end

  context '#find' do
    it 'finds the best merchants' do
      m = Merchant.create(name: 'i am a merchant')
      get :find, name: 'i am a merchant', format: :json
      expect(response).to have_http_status(:ok)

      merchant = JSON.parse(response.body)
      expect(merchant['name']).to eq('i am a merchant')
    end
  end

  context '#find_all' do
    it 'finds all of the merchants with a certain attribute' do
      m = Merchant.create(name: 'i am a merchant')
      get :find_all, name: 'i am a merchant', format: :json
      expect(response).to have_http_status(:ok)

      merchants = JSON.parse(response.body)
      expect(merchants.first['name']).to eq('i am a merchant')
    end
  end

  context '#random' do
    it 'returns a random merchant' do
      get :random, format: :json
      expect(response).to have_http_status(:ok)

      merchant = JSON.parse(response.body)
      expect(merchant.first).to be_a(Hash)
    end
  end

  context '#most_revenue' do
    it 'returns the merchants with the most revenue' do
      get :most_revenue, quantity: 2, format: :json

      expect(response).to have_http_status(:ok)

      merchants = JSON.parse(response.body)
      expect(merchants.first['id']).to eq(1)
      expect(merchants.last['id']).to eq(3)
    end
  end

  context '#revenue' do
    it 'returns the revenue for a given date' do
      get :revenue, date: "2015-07-27 14:06:40", format: :json

      expect(response).to have_http_status(:ok)

      revenue = response.body
      expect(revenue).to eq("\"500.0\"")
    end
  end

  context '#most_items' do
    it 'returns the merchants who sold the most items' do
      get :most_items, quantity: 2, format: :json

      expect(response).to have_http_status(:ok)

      merchants = JSON.parse(response.body)
      expect(merchants.first['id']).to eq(1)
      expect(merchants.last['id']).to eq(3)
    end
  end

  context '#show_revenue' do
    it 'shows a merchants revenue for a certain date' do
      m = Merchant.first

      get :show_revenue, id: m.id, date: "2015-07-27 14:06:40", format: :json

      expect(response).to have_http_status(:ok)

      revenue = response.body
      expect(revenue).to eq("\"300.0\"")
    end
  end

  context '#favorite_customer' do
    it 'knows a merchants favorite customer' do
      m = Merchant.first

      get :favorite_customer, id: m.id, format: :json

      expect(response).to have_http_status(:ok)

      customer = JSON.parse(response.body)
      expect(customer['first_name']).to eq('Joe')
    end
  end

  context '#customers_with_pending_invoices' do
    it 'knows customers who need to pay' do
      m = Merchant.find(2)

      get :customers_with_pending_invoices, id: m.id, format: :json

      expect(response).to have_http_status(:ok)

      customer = JSON.parse(response.body)

      expect(customer.first['first_name']).to eq('Jill')
    end
  end
end
