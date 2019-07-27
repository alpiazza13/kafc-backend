require 'spec_helper'

RSpec.describe Team, type: :model do
    describe 'model structure' do
      it 'has its columns' do
        expect(Team.column_names.include?('name')).to be true
        expect(Team.column_names.include?('color')).to be true
        expect(Team.column_names.include?('id')).to be true
        expect(Team.column_names.include?('type')).to be true

      end
    end

    describe 'validation' do
      it 'requires a name and valid type' do
        new_team = Team.new
        expect(new_team.valid?).to be false

        new_team.name = 'Chelsea'
        expect(new_team.valid?).to be false

        new_team.type = 'alex'
        expect(new_team.valid?).to be false

        new_team.type = 'RealTeam'
        expect(new_team.valid?).to be true

      end
    end
end
