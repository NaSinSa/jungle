require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before do
      @user = User.new(:first_name => 'first',
                      :last_name => 'last',
                      :email => 'email@email.com',
                      :password => 'password',
                      :id => 1)
    end
    @user2 = User.new(:first_name => 'firstN',
                :last_name => 'lastN',
                :email => 'email2@email.com',
                :password => 'password',
                :id => 2)

    it 'is not valid without a first name' do
      user = @user
      user.first_name = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages.first).to eq "First name can't be blank"
    end

    it 'is not valid without a last name' do
      user = @user
      user.last_name = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages.first).to eq "Last name can't be blank"
    end

    it 'is not valid without an email' do
      user = @user
      user.email = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages.first).to eq "Email can't be blank"
    end

    it 'is not valid with an existing email' do
      user = @user
      user.email = 'email2@email.com'
      expect(user).to_not be_valid
      expect(user.errors.full_messages.first).to eq "Email can't be the same"
    end

    it 'is not valid without a password' do
      user = @user
      user.password = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages.first).to eq "Password can't be blank"
    end

    it 'is not valid if a password is too short' do
      user = @user
      user.password = 'a'
      expect(user).to_not be_valid
      expect(user.errors.full_messages.first).to eq "Password is too short (minimum is 2 characters)"
    end

  end
end
