require 'rails_helper'

RSpec.describe Api::V1::ContactsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: 'organisations/1/contacts')
        .to route_to('api/v1/contacts#create', organisation_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'organisations/1/contacts/1')
        .to route_to('api/v1/contacts#update', organisation_id: '1', id: '1')
    end

    it 'routes to #show' do
      expect(get: 'organisations/1/contacts/1')
        .to route_to('api/v1/contacts#show', organisation_id: '1', id: '1')
    end

    it 'routes to #index' do
      expect(get: 'organisations/1/contacts')
        .to route_to('api/v1/contacts#index', organisation_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'organisations/1/contacts/1')
        .to route_to('api/v1/contacts#destroy', organisation_id: '1', id: '1')
    end
  end
end
