# frozen_string_literal: true

require 'rails_helper'

# FIXME: remove some magic numbers
# FIXME: reduce block size and improve modularization
RSpec.describe 'Ebooks API', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let!(:ebooks) { create_list(:ebook, 10) }
  let(:ebook_id) { ebooks.first.rel_id }
  let(:rand_id) { rand(2_000_000) }
  let(:provider_id) { 2 }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for POST /ebooks/rate
  describe 'POST /ebooks/rate' do
    # valid payload
    let(:valid_attributes) do
      { ebook: ebook_id, provider: provider_id, rating: 5 }.to_json
    end

    context 'when the request is valid' do
      before { post '/ebooks/rate', params: valid_attributes, headers: headers }

      it 'rates the ebook' do
        expect(json['id']).to eq(ebook_id)
        expect(json['ratings']).to eq(1)
        expect(json['rating_avg']).to eq(5)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for POST /ebooks/download
  describe 'POST /ebooks/download' do
    # valid payload
    let(:valid_attributes) do
      { ebook: ebook_id, provider: provider_id }.to_json
    end

    context 'when the request is valid and ebook is cached' do
      before do
        post '/ebooks/download', params: valid_attributes,
                                 headers: headers
      end

      it 'notifies that the ebook has been downloaded' do
        expect(json['ebook']['id']).to eq(ebook_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is valid and ebook is NOT cached' do
      let(:valid_attributes) do
        { ebook: rand_id, provider: provider_id }.to_json
      end

      before do
        post '/ebooks/download', params: valid_attributes,
                                 headers: headers
      end

      it 'notifies that the ebook has been downloaded' do
        expect(json['ebook']['id']).to eq(rand_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end