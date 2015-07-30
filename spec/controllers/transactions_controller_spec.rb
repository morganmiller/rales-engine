require 'rails_helper'

describe Api::V1::TransactionsController do
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
      i = Transaction.first

      get :show, id: i.id, format: :json

      expect(response).to have_http_status(:ok)

      invoice = JSON.parse(response.body)
      expect(invoice['id']).to eq(i.id)
    end
  end
end
