# spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'Ebooks API', type: :request do
  # initialize test data
  let!(:ebooks) { create_list(:ebook, 10) }
  let(:ebook_id) { ebooks.first.id }

  # Test suite for POST /ebooks/rate
  describe 'POST /ebooks/rate' do
    # valid payload
    let(:valid_attributes) { { id: ebook_id, rating: 5 } }

    context 'when the request is valid' do
      before { post '/ebooks/rate', params: valid_attributes }

      it 'rates the ebook' do
        expect(json['id']).to eq(ebook_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for POST /ebooks/download
  describe 'POST /ebooks/download' do
    # valid payload
    let(:valid_attributes) { { id: ebook_id } }

    context 'when the request is valid' do
      before { post '/ebooks/download', params: valid_attributes }

      it 'notifies that the ebook has been downloaded' do
        expect(json['id']).to eq(ebook_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end