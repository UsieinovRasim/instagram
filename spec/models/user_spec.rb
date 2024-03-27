# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }

  describe 'associations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_one_attached(:avatar) }
    it { is_expected.to have_many(:sent_messages).class_name('Message').with_foreign_key('sender_id') }
    it { is_expected.to have_many(:received_messages).class_name('Message').with_foreign_key('receiver_id') }
  end

  describe 'validations' do
    it { is_expected.to validate_length_of(:website).is_at_most(30) }
    it { is_expected.to validate_length_of(:about_myself).is_at_most(150) }
  end

  describe '.ransackable_attributes' do
    it 'returns the list of searchable attributes' do
      expect(described_class.ransackable_attributes(nil)).to contain_exactly('email', 'fullname', 'username', 'website')
    end
  end
end
