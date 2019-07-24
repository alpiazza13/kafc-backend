require 'spec_helper'

RSpec.describe UserTeam, type: :model do
    describe 'model structure' do
      it 'has its columns' do
        expect(UserTeam.column_names.include?('user_id')).to be true
        expect(UserTeam.column_names.include?('team_id')).to be true

        end
    end

    describe 'validation' do
      it 'requires a team and user' do
        new_team = UserTeam.new
        expect(new_team.valid?).to be false

        new_team.user_id = 1
        expect(new_team.valid?).to be false

        team = Fabricate(:team)
        new_team.team_id = team.id
        expect(new_team.valid?).to be true
      end
    end
end
