require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'model structure' do
    it 'has its columns' do
      expect(User.column_names.include?('email')).to be true
      expect(User.column_names.include?('first_name')).to be true
      expect(User.column_names.include?('last_name')).to be true
    end
  end

  describe 'validation' do
    it 'requires an email' do
      user = User.new
      expect(user.valid?).to be false

      user.email = 'a@b.com'
      expect(user.valid?).to be true
    end
  end
end
