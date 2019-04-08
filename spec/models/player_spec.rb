require 'spec_helper'

RSpec.describe Player, type: :model do
  describe 'model structure' do
    it 'has its columns' do
      expect(Player.column_names.include?('first_name')).to be true
      expect(Player.column_names.include?('last_name')).to be true
      expect(Player.column_names.include?('age')).to be true
    end
  end
end


