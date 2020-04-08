require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'validate user columns' do
    let(:user) do
      FactoryBot.create(:user)
    end

    it 'valid with name and email and password' do
      user
      expect(user).to be_valid
    end

    it 'invalid without email' do
      user = FactoryBot.build(:user, :without_email)
      expect(user.valid?).to be false
    end

    it 'invalid email' do
      user = FactoryBot.build(:user, :invalid_email)
      expect(user.valid?).to be false
    end

    it 'invalid password' do
      user = FactoryBot.build(:user, :invalid_password)
      expect(user.valid?).to be false
    end

    it 'invalid password_confirmation' do
      user = FactoryBot.build(:user, :invalid_password_confirmation)
      expect(user.valid?).to be false
    end
  end
end
