# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController do
  let(:user) { create(:user) }
  let(:post) { create(:post, user:) }
  let(:comment) { create(:comment, post:) }

  describe 'GET #index' do
    it 'assigns all comments as @comments' do
      get :index
      expect(assigns(:comments)).to eq(Comment.all)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested comment as @comment' do
      get :show, params: { id: comment.id }
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe 'GET #new' do
    it 'assigns a new comment as @comment' do
      get :new
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested comment as @comment' do
      get :edit, params: { id: comment.id }
      expect(assigns(:comment)).to eq(comment)
    end
  end

  # describe 'POST #create' do
  #   context 'with valid params' do
  #     let(:valid_attributes) { attributes_for(:comment, user_id: user.id, post_id: post.id) }
  #
  #     it 'creates a new comment' do
  #       expect do
  #         post :create, params: { comment: valid_attributes }
  #       end.to change(Comment, :count).by(1)
  #     end
  #
  #     it 'redirects to the associated post' do
  #       post :create, params: { comment: valid_attributes }
  #       expect(response).to redirect_to(post)
  #     end
  #   end
  #
  #   context 'with invalid params' do
  #     let(:invalid_attributes) { attributes_for(:comment, text: '', user_id: user.id, post_id: post.id) }
  #
  #     it 'does not create a new comment' do
  #       expect do
  #         post :create, params: { comment: invalid_attributes }
  #       end.not_to change(Comment, :count)
  #     end
  #
  #     it 're-renders the new template' do
  #       post :create, params: { comment: invalid_attributes }
  #       expect(response).to render_template(:new)
  #     end
  #   end
  # end

  describe 'PATCH #update' do
    context 'with valid params' do
      let(:new_attributes) { { text: 'Updated comment' } }

      it 'updates the requested comment' do
        patch :update, params: { id: comment.id, comment: new_attributes }
        comment.reload
        expect(comment.text).to eq('Updated comment')
      end

      it 'redirects to the associated post' do
        patch :update, params: { id: comment.id, comment: new_attributes }
        expect(response).to redirect_to(comment.post)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { text: '' } }

      it 'does not update the comment' do
        expect do
          patch :update, params: { id: comment.id, comment: invalid_attributes }
        end.not_to(change { comment.reload.text })
      end

      it 're-renders the edit template' do
        patch :update, params: { id: comment.id, comment: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested comment' do
      comment_to_destroy = create(:comment, post:)
      expect do
        delete :destroy, params: { id: comment_to_destroy.id }
      end.to change(Comment, :count).by(-1)
    end

    it 'redirects to the associated post' do
      delete :destroy, params: { id: comment.id }
      expect(response).to redirect_to(comment.post)
    end
  end
end
