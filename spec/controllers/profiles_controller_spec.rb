# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfilesController do
  let(:user) { create(:user) }

  describe 'GET #index' do
    it 'assigns @users with search results' do
      user_with_searched_username = create(:user, username: 'searched_username')
      get :index, params: { query: 'searched_username' }
      expect(assigns(:users)).to eq([user_with_searched_username])
    end
  end
end
