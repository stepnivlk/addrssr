require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: 'organisations/1/users')
        .to route_to('api/v1/users#create', organisation_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'organisations/1/users/1')
        .to route_to('api/v1/users#update', organisation_id: '1', id: '1')
    end

    it 'routes to #show' do
      expect(get: 'organisations/1/users/1')
        .to route_to('api/v1/users#show', organisation_id: '1', id: '1')
    end

    it 'routes to #index' do
      expect(get: 'organisations/1/users')
        .to route_to('api/v1/users#index', organisation_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'organisations/1/users/1')
        .to route_to('api/v1/users#destroy', organisation_id: '1', id: '1')
    end
  end
end
