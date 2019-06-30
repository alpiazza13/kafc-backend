require 'spec_helper'

RSpec.describe Position, type: :model do
  describe 'model structure' do
    it 'has its columns' do
      expect(Position.column_names.include?('name')).to be true
    end
  end

  describe 'validation' do
    it 'requires a name' do
      new_position = Position.new
      expect(new_position.valid?).to be false

      new_position.name = 'Defender'

      expect(new_position.valid?).to be true      
    end
  end

end
