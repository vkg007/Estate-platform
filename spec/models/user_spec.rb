require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validation tests' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:mobile) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
    it { should validate_length_of(:password).is_at_least(6).is_at_most(40) }
  end

  describe 'associations' do
    it { should have_many(:properties).dependent(:destroy) }
    it { should have_many(:contracts).dependent(:destroy) }
    it { should have_many(:addresses).dependent(:destroy) }
    it { should have_one_attached(:image) }
  end
end
