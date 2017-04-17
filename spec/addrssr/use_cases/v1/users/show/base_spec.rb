require 'spec_helper'

describe UseCases::V1::Users::Show::Base, :show_user do
  def make_the_call(id, params = {})
    params[:user_id] = id

    @context = described_class.perform(params)
  end

  context 'When admin is logged in' do
    let(:organisation) { create(:organisation) }
    let(:admin) { create(:user, role: 0, organisation: organisation) }
    let(:user) { create(:user, organisation: organisation) }

    it 'shows user for given ID' do
      make_the_call \
        user.id, current_user: admin, organisation_id: organisation.id

      expect(@context.http_status).to eq(200)
      expect(@context.data).to eq(user)
    end

    it 'shows error message when user for given Id doesnt exist' do
      make_the_call \
        2323, current_user: admin, organisation_id: organisation.id

      expect(@context.http_status).to eq(404)
      expect(@context.data).to match \
        a_hash_including(message: 'User not found for given id')
    end
  end

  context 'When normal user is logged in' do
    let(:organisation) { create(:organisation) }
    let(:another_organisation) { create(:organisation) }

    let(:current_user) { create(:user, organisation: organisation) }
    let(:user) { create(:user, organisation: organisation) }
    let(:another_user) { create(:user, organisation: another_organisation) }

    it 'shows user when ID matches current_user ID' do
      make_the_call \
        current_user.id, current_user: current_user,
                         organisation_id: organisation.id

      expect(@context.http_status).to eq(200)
      expect(@context.data).to eq(current_user)
    end

    it 'shows error message when given ID differs from current_user ID in the' \
      ' same organisation' do
      make_the_call \
        user.id, current_user: current_user, organisation_id: organisation.id

      expect(@context.http_status).to eq(422)
      expect(@context.data).to match \
        a_hash_including(message: 'you dont have rights for this user')
    end

    it 'shows error message when given ID differs from current_user ID in the' \
      ' another organisation' do
      make_the_call \
        another_user.id, current_user: current_user,
                         organisation_id: another_organisation.id

      expect(@context.http_status).to eq(422)
      expect(@context.data).to match \
        a_hash_including(message: 'you dont have rights for this user')
    end
  end
end
