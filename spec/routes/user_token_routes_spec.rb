require 'rails_helper'

RSpec.describe Api::V1::UserTokenController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: 'user_token')
        .to route_to('api/v1/user_token#create')
    end
  end
end
