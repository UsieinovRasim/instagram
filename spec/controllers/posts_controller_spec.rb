# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController do
  let(:user) { create(:user) }
  let(:post) { create(:post, user:) }

  before { sign_in user }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested post as @post' do
      get :show, params: { id: post.id }
      expect(assigns(:post)).to eq(post)
    end

    it 'assigns a new comment to @comment' do
      get :show, params: { id: post.id }
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it 'assigns comments of the post to @comments' do
      comments = create_list(:comment, 3, post:)
      get :show, params: { id: post.id }
      expect(assigns(:comments)).to match_array(comments)
    end

    it 'renders the show template' do
      get :show, params: { id: post.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'assigns a new post as @post' do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  # describe 'POST #create' do
  #   context 'with valid params' do
  #     let(:valid_attributes) { attributes_for(:post, user_id: user.id) }
  #
  #     it 'creates a new post' do
  #       expect do
  #         post :create, params: { post: valid_attributes }
  #       end.to change(Post, :count).by(1)
  #     end
  #
  #     it 'redirects to the user profile page' do
  #       # puts params: { post: valid_attributes }
  #       post :create, params: { post: valid_attributes }
  #       expect(response).to redirect_to(user_path(current_user))
  #     end
  #   end
  #
  #   context 'with invalid params' do
  #     let(:invalid_attributes) { attributes_for(:post, description: nil, user_id: user.id) }
  #
  #     it 'does not create a new post' do
  #       expect do
  #         post :create, params: { post: invalid_attributes }
  #       end.not_to change(Post, :count)
  #     end
  #
  #     it 're-renders the new template' do
  #       post :create, params: { post: invalid_attributes }
  #       expect(response).to render_template(:new)
  #     end
  #   end
  # end

  describe 'GET #edit' do
    it 'assigns the requested post as @post' do
      get :edit, params: { id: post.id }
      expect(assigns(:post)).to eq(post)
    end

    it 'renders the edit template' do
      get :edit, params: { id: post.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      let(:new_attributes) { { description: 'Updated description' } }

      it 'updates the requested post' do
        patch :update, params: { id: post.id, post: new_attributes }
        post.reload
        expect(post.description).to eq('Updated description')
      end

      it 'redirects to the post' do
        patch :update, params: { id: post.id, post: new_attributes }
        expect(response).to redirect_to(post_path(post))
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { description: '' } }

      it 'does not update the post' do
        expect do
          patch :update, params: { id: post.id, post: invalid_attributes }
        end.not_to(change { post.reload.description })
      end

      it 're-renders the edit template' do
        patch :update, params: { id: post.id, post: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end
end
