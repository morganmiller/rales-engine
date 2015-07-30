require 'rails_helper'

describe Api::V1::CustomersController do
  context '#index' do
    it 'returns all the customers' do
      get :index, format: :json

      expect(response).to have_http_status(:ok)
      customers = JSON.parse(response.body)
      expect(customers.count).to eq(2)

      customer = customers.first
      expect(customer['first_name']).to eq('Joe')
    end
  end

  context '#show' do
    it 'returns the requested customer' do
      c = Customer.first

      get :show, id: c.id, format: :json

      expect(response).to have_http_status(:ok)

      customer = JSON.parse(response.body)
      expect(customer['first_name']).to eq('Joe')
    end
  end

  context '#find' do
    it 'finds the best customers' do
      get :find, first_name: 'Joe', format: :json
      expect(response).to have_http_status(:ok)

      customer = JSON.parse(response.body)
      expect(customer['first_name']).to eq('Joe')
    end
  end

  context '#find_all' do
    it 'finds all of the customers with a certain attribute' do
      get :find_all, first_name: 'Jill', format: :json
      expect(response).to have_http_status(:ok)

      customers = JSON.parse(response.body)
      expect(customers.first['first_name']).to eq('Jill')
    end
  end

  context '#random' do
    it 'returns a random customer' do
      get :random, format: :json
      expect(response).to have_http_status(:ok)

      customer = JSON.parse(response.body)
      expect(customer.first).to be_a(Hash)
    end
  end

  context '#favorite_merchant' do
    it 'returns a customer\'s favorite merchant' do
      get :favorite_merchant, id: 1, format: :json

      expect(response).to have_http_status(:ok)

      merchant = JSON.parse(response.body)
      expect(merchant['id']).to eq(1)
    end
  end
end
