require 'rails_helper'

describe Api::V1::InvoiceItemsController do
  context '#index' do
    it 'returns all the invoice_items' do
      get :index, format: :json

      expect(response).to have_http_status(:ok)
      invoice_items = JSON.parse(response.body)
      expect(invoice_items.count).to eq(3)

      invoice_item = invoice_items.first
      expect(invoice_item['id']).to eq(1)
    end
  end

  context '#show' do
    it 'returns the requested invoice_item' do
      i = InvoiceItem.first

      get :show, id: i.id, format: :json

      expect(response).to have_http_status(:ok)

      invoice_item = JSON.parse(response.body)
      expect(invoice_item['id']).to eq(i.id)
    end
  end

  context '#find' do
    it 'finds the best invoice_items' do
      get :find, status: 'shipped', format: :json
      expect(response).to have_http_status(:ok)

      invoice_item = JSON.parse(response.body)
      expect(invoice_item['id']).to eq(1)
    end
  end

  context '#find_all' do
    it 'finds all of the invoice_items with a certain attribute' do
      get :find_all, status: 'shipped', format: :json
      expect(response).to have_http_status(:ok)

      invoice_items = JSON.parse(response.body)
      expect(invoice_items.count).to eq(3)
    end
  end

  context '#random' do
    it 'returns a random invoice_item' do
      get :random, format: :json
      expect(response).to have_http_status(:ok)

      invoice_item = JSON.parse(response.body)
      expect(invoice_item.first).to be_a(Hash)
    end
  end
end
