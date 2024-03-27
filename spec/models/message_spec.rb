# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message do
  let(:sender) { create(:user) }
  let(:receiver) { create(:user) }

  describe 'associations' do
    it { is_expected.to belong_to(:sender).class_name('User') }
    it { is_expected.to belong_to(:receiver).class_name('User') }
    it { is_expected.to have_many(:replies).class_name('Message').with_foreign_key('parent_message_id').dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:sender) }
    it { is_expected.to validate_presence_of(:receiver) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'callbacks' do
    it 'sets read attribute to false before creation' do
      message = create(:message)
      expect(message.read).to be(false)
    end
  end
end
