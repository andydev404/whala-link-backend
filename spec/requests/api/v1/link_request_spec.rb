require 'rails_helper'

RSpec.describe 'Links', type: :request do
  describe 'POST /links' do
    before :each do
      post '/api/v1/links', params: { link: { long_url: 'https://whala.link', slug: 'my-website' } }
    end

    it 'should shorten the url' do
      expect(response).to have_http_status(:created)
    end

    it 'response body should contain expected attributes' do
      expect(response.body).to include_json(
        data: {
          type: 'link',
          attributes: {
            long_url: 'https://whala.link',
            slug: 'my-website'
          }
        }
      )
    end
  end

  describe 'GET /links/:slug' do
    before :each do
      post '/api/v1/links', params: { link: { long_url: 'https://whala.link', slug: 'my-website' } }
      get '/api/v1/links/my-website'
    end

    it 'should find the record' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body should contain expected attributes' do
      expect(response.body).to include_json(
        data: {
          type: 'link',
          attributes: {
            long_url: 'https://whala.link',
            slug: 'my-website'
          }
        }
      )
    end
  end
end