require 'rails_helper'

describe Api::V1::InvoicesController do
  context '#index' do
    it 'returns all the invoices' do
      get :index, format: :json

      expect(response).to have_http_status(:ok)
      invoices = JSON.parse(response.body)
      expect(invoices.count).to eq(3)

      invoice = invoices.first
      expect(invoice['id']).to eq(1)
    end
  end

  context '#show' do
    it 'returns the requested invoice' do
      i = Invoice.first

      get :show, id: i.id, format: :json

      expect(response).to have_http_status(:ok)

      invoice = JSON.parse(response.body)
      expect(invoice['id']).to eq(i.id)
    end
  end

  context '#find' do
    it 'finds the best invoices' do
      get :find, status: 'shipped', format: :json
      expect(response).to have_http_status(:ok)

      invoice = JSON.parse(response.body)
      expect(invoice['id']).to eq(1)
    end
  end

  context '#find_all' do
    it 'finds all of the invoices with a certain attribute' do
      get :find_all, status: 'shipped', format: :json
      expect(response).to have_http_status(:ok)

      invoices = JSON.parse(response.body)
      expect(invoices.count).to eq(3)
    end
  end

  context '#random' do
    it 'returns a random invoice' do
      get :random, format: :json
      expect(response).to have_http_status(:ok)

      invoice = JSON.parse(response.body)
      expect(invoice.first).to be_a(Hash)
    end
  end
end
