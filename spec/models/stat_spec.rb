require 'spec_helper'

RSpec.describe Stat, type: :model do
  describe 'model structure' do
    it 'has its columns' do
      expect(Stat.column_names.include?('stat_name')).to be true
      expect(Stat.column_names.include?('points')).to be true
    end
  end

  describe 'validation' do
    it 'requires a name and points' do
      stat = Stat.new
      expect(stat.valid?).to be false

      stat.stat_name = 'Goals'
      expect(stat.valid?).to be false

      stat.points = 3
      expect(stat.valid?).to be true      
    end
  end


end
