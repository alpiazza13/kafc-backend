require 'spec_helper'

RSpec.describe Position, type: :model do
  describe 'model structure' do
    it 'has its columns' do
      expect(Position.column_names.include?('player_position')).to be true
    end
  end

  describe 'validation' do
    it 'requires a player_position' do
      stat = Position.new
      expect(position.valid?).to be false

      position.player_position = 'defender'
      #expect(position.valid?).to be false

      expect(stat.valid?).to be true      
    end
  end
end
