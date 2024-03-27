# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET #show' do
    it 'assigns the requested user as @user' do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it 'assigns posts of the user to @posts' do
      posts = create_list(:post, 3, user:)
      get :show, params: { id: user.id }
      expect(assigns(:posts)).to match_array(posts)
    end

    it 'renders the show template' do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested user as @user' do
      get :edit, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it 'renders the edit template' do
      get :edit, params: { id: user.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { about_myself: 'Updated about myself' }
      end

      it 'updates the requested user' do
        patch :update, params: { id: user.id, user: new_attributes }
        user.reload
        expect(user.about_myself).to eq('Updated about myself')
      end

      it 'redirects to the root path' do
        patch :update, params: { id: user.id, user: new_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) do
        { about_myself: '' }
      end

      it 'renders the edit template' do
        patch :update, params: { id: user.id, user: invalid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
