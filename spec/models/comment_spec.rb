# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment do
  let(:user) { create(:user) }
  let(:post) { create(:post, user:) }
  let(:comment) { create(:comment, user:, post:) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:text) }
  end

  describe '#user' do
    it 'returns the user associated with the comment' do
      expect(comment.user).to eq(user)
    end
  end
end
