# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end

  describe 'validations' do
    subject { described_class.new(user:, post:) }

    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:post_id) }
  end
end
