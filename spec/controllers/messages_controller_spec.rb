# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessagesController do
  let(:user) { create(:user) }
  let(:receiver) { create(:user) }
  let(:message) { create(:message, sender: user, receiver:) }

  before { sign_in user }

  describe 'GET #index' do
    it 'assigns received messages to @messages' do
      get :index
      expect(assigns(:messages)).to eq(user.received_messages.order(created_at: :desc))
    end
  end

  describe 'GET #show' do
    it 'assigns the requested message as @message' do
      get :show, params: { id: message.id }
      expect(assigns(:message)).to eq(message)
    end

    it 'builds a reply for the message' do
      get :show, params: { id: message.id }
      expect(assigns(:reply)).to be_a_new(Message)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) { attributes_for(:message, receiver_id: receiver.id) }

      it 'creates a new message' do
        expect do
          post :create, params: { message: valid_attributes }
        end.to change(Message, :count).by(1)
      end

      it 'redirects to messages path' do
        post :create, params: { message: valid_attributes }
        expect(response).to redirect_to(messages_path)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { attributes_for(:message, content: '') }

      it 'does not create a new message' do
        expect do
          post :create, params: { message: invalid_attributes }
        end.not_to change(Message, :count)
      end

      it 'renders the new template' do
        post :create, params: { message: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'POST #create_reply' do
    let(:reply_attributes) { attributes_for(:message) }

    # it 'creates a new reply to the message' do
    #   expect do
    #     post :create_reply, params: { message_id: message.id, message: reply_attributes }
    #   end.to change(Message, :count).by(1)
    # end

    it 'redirects to the message path' do
      post :create_reply, params: { message_id: message.id, message: reply_attributes }
      expect(response).to redirect_to(message_path(message))
    end
  end

  describe 'DELETE #destroy' do
    # it 'destroys the requested message' do
    #   expect {
    #     delete :destroy, params: { id: message.id }
    #   }.to change(Message, :count).by(-1)
    # end

    it 'redirects to messages path' do
      delete :destroy, params: { id: message.id }
      expect(response).to redirect_to(messages_path)
    end
  end
end
