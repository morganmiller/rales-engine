require 'rails_helper'

describe Api::V1::ItemsController do
  context '#index' do
    it 'returns all the items' do
      get :index, format: :json

      expect(response).to have_http_status(:ok)
      items = JSON.parse(response.body)
      expect(items.count).to eq(3)

      item = items.last
      expect(item['name']).to eq('Silver Spoon')
    end
  end

  context '#show' do
    it 'returns the requested item' do
      i = Item.first

      get :show, id: i.id, format: :json

      expect(response).to have_http_status(:ok)

      item = JSON.parse(response.body)
      expect(item['name']).to eq('Black Hat')
    end
  end

  context '#find' do
    it 'finds the best items' do
      get :find, name: 'Black Hat', format: :json
      expect(response).to have_http_status(:ok)

      item = JSON.parse(response.body)
      expect(item['name']).to eq('Black Hat')
    end
  end

  context '#find_all' do
    it 'finds all of the items with a certain attribute' do
      get :find_all, name: 'Silver Spoon', format: :json
      expect(response).to have_http_status(:ok)

      items = JSON.parse(response.body)
      expect(items.first['name']).to eq('Silver Spoon')
    end
  end

  context '#random' do
    it 'returns a random item' do
      get :random, format: :json
      expect(response).to have_http_status(:ok)

      item = JSON.parse(response.body)
      expect(item.first).to be_a(Hash)
    end
  end

  context '#most_revenue' do
    it 'returns the items with the most revenue' do
      get :most_revenue, quantity: 2, format: :json

      expect(response).to have_http_status(:ok)

      items = JSON.parse(response.body)
      expect(items.first['id']).to eq(1)
      expect(items.last['id']).to eq(3)
    end
  end

  context '#most_items' do
    it 'returns the items that have sold the most quantities' do
      get :most_items, quantity: 2, format: :json

      expect(response).to have_http_status(:ok)

      items = JSON.parse(response.body)
      expect(items.first['id']).to eq(3)
      expect(items.last['id']).to eq(1)
    end
  end

  context '#best_day' do
    it 'shows a items revenue for a certain date' do
      i = Item.first

      get :best_day, id: i.id, format: :json

      expect(response).to have_http_status(:ok)

      revenue = response.body
      expect(revenue).to eq("\"2015-07-27T14:06:40.000Z\"")
    end
  end
end
