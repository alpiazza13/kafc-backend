require 'spec_helper'

RSpec.describe Player, type: :model do
  describe 'model structure' do
    it 'has its columns' do
      expect(Player.column_names.include?('first_name')).to be true
      expect(Player.column_names.include?('last_name')).to be true
      expect(Player.column_names.include?('age')).to be true
      expect(Player.column_names.include?('team_id')).to be true
      expect(Player.column_names.include?('position_id')).to be true 
    end
  end

  describe 'validation' do
      it 'requires a name' do
          new_player = Player.new
          expect(new_player.valid?).to be false

          new_player.first_name = 'Willian'
          expect(new_player.valid?).to be false

          new_player.last_name = 'Borges'
          expect(new_player.valid?).to be true

      end
  end
end
