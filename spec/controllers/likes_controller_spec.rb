# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let!(:like) { create(:like, user:, post:) }

  before { sign_in user }

  # describe 'POST #create' do
  #   context 'with valid params' do
  #     it 'creates a new like' do
  #       expect do
  #         binding.pry
  #
  #         post :create, params: { like: { post_id: post.id } }
  #       end.to change(Like, :count).by(1)
  #     end
  #
  #     it 'redirects to the post' do
  #       post :create, params: { like: { post_id: post.id } }
  #       expect(response).to redirect_to(post_path(post))
  #     end
  #   end
  # end

  describe 'DELETE #destroy' do
    it 'destroys the like' do
      expect do
        delete :destroy, params: { id: like.id }
      end.to change(Like, :count).by(-1)
    end

    it 'redirects to the post' do
      delete :destroy, params: { id: like.id }
      expect(response).to redirect_to(post_path(post))
    end
  end
end
