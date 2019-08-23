require 'spec_helper'

RSpec.describe Lineup, type: :model do
    describe 'model structure' do
        it 'has its columns' do
            expect(Lineup.column_names.include?('formation_id')).to be true
            expect(Lineup.column_names.include?('user_team_id')).to be true
            expect(Lineup.column_names.include?('matchweek')).to be true
        end
    end

    describe 'validation' do
        it 'requires a formation' do
            l = Lineup.new
            expect(l.valid?).to be false

            l.formation_id = 2
            expect(l.valid?).to be true
        end
    end
end
