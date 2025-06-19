# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do # rubocop:disable Metrics/BlockLength
  let(:valid_user) { User.create!(user_id: 1, email: 'vinay@example.com', name: 'Vinay') }

  before do
    allow(controller).to receive(:current_user).and_return(valid_user)
  end

  describe 'GET #show' do
    let(:user) { User.create!(name: 'Vinay', email: 'vinay@example.com') }

    it 'assigns the requested user to @current_user' do
      get :show, params: { id: user.id }
      expect(controller.instance_variable_get(:@current_user)).to eq(user)
    end

    it 'returns a success response' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end

    context 'when the user does not exist' do
      it 'raises an ActiveRecord::RecordNotFound error' do
        expect do
          get :show, params: { id: -1 } # Assuming -1 does not exist
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'PATCH #update' do
    let(:user) { User.create!(name: 'Vinay', email: 'vinay@example.com') }

    context 'with valid parameters' do
      let(:valid_attributes) { { user: { name: 'Vinay', email: 'vinay@example.com' } } }

      it 'updates the user and redirects to user profiles' do
        patch :update, params: { id: user.id, **valid_attributes }
        user.reload
        expect(user.name).to eq('Vinay')
        expect(response).to redirect_to(user_profiles_path)
        expect(flash[:notice]).to eq('User was successfully updated.')
      end
    end

    # context 'with invalid parameters' do
    #   let(:invalid_attributes) { { user: { email: nil } } }

    #   it 'does not update the user and renders the show template' do
    #     patch :update, params: { id: user.id, **invalid_attributes }
    #     user.reload
    #     expect(user.email).not_to be_nil
    #     expect(response).to render_template(:show)
    #     expect(response.status).to eq(422)
    #   end
    # end
    #
  end
  describe 'PATCH #update_auth_level' do
    let(:user) { User.create!(auth_level: 0, role: 'Students', email: 'vinay@example.com') }
    context 'when the update is successful' do
      before do
        patch :update_auth_level, params: { id: user.id, auth_level: 1 }
      end

      it 'updates the auth level and returns the updated attributes' do
        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response['auth_level']).to eq(1)
        expect(json_response['role']).to eq('Assistants')
        expect(user.reload.auth_level).to eq(1)
      end
    end

    context 'when the update fails' do
      before do
        # Assuming auth_level must be a specific range, e.g., 0-2
        patch :update_auth_level, params: { id: user.id, auth_level: 5 }
      end

      it 'returns an error message' do
        expect(response).to have_http_status(:unprocessable_entity)
        json_response = JSON.parse(response.body)
        expect(json_response['status']).to eq('error')
      end
    end
  end

  describe 'PATCH #update' do
    let(:user) { User.create!(name: 'Vinay', email: 'vinay@example.com') }

    context 'with valid parameters' do
      let(:valid_attributes) { { user: { name: 'Vinay', email: 'vinay@example.com' } } }

      it 'updates the user and redirects to user profiles' do
        patch :update, params: { id: user.id, **valid_attributes }
        user.reload
        expect(user.name).to eq('Vinay')
        expect(response).to redirect_to(user_profiles_path)
        expect(flash[:notice]).to eq('User was successfully updated.')
      end
    end

    # context 'with invalid parameters' do
    #   let(:invalid_attributes) { { user: { email: nil } } }

    #   it 'does not update the user and renders the show template' do
    #     patch :update, params: { id: user.id, **invalid_attributes }
    #     user.reload
    #     expect(user.email).not_to be_nil
    #     expect(response).to render_template(:show)
    #     expect(response.status).to eq(422)
    #   end
    # end
  end
end
