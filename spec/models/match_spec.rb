require 'spec_helper'

RSpec.describe Match, type: :model do
  describe 'model structure' do
      it 'has its columns' do
          expect(Match.column_names.include?('home_team_id')).to be true
          expect(Match.column_names.include?('away_team_id')).to be true
          expect(Match.column_names.include?('date')).to be true
          expect(Match.column_names.include?('matchweek')).to be true
      end
  end

  describe 'validation' do
      let(:home_team) { Fabricate(:real_team) }
      let(:away_team) { Fabricate(:real_team) }

      it 'requires an away team' do
          new_match = Match.new
          expect(new_match.valid?).to be false

          new_match.home_team_id = home_team.id
          expect(new_match.valid?).to be false

          new_match.away_team_id = away_team.id
          expect(new_match.valid?).to be true
      end

      it 'requires a home team' do
          new_match = Match.new
          expect(new_match.valid?).to be false

          new_match.away_team_id = away_team.id
          expect(new_match.valid?).to be false

          new_match.home_team_id = home_team.id
          expect(new_match.valid?).to be true
      end
  end
end
