require 'spec_helper'

RSpec.describe FantasyTeamPlayer, type: :model do
    describe 'model structure' do
      it 'has its columns' do
        expect(FantasyTeamPlayer.column_names.include?('player_id')).to be true
        expect(FantasyTeamPlayer.column_names.include?('user_team_id')).to be true

        end
    end

    describe 'validation' do
      it 'requires a player and user_team' do
        new_player = FantasyTeamPlayer.new
        expect(new_player.valid?).to be false

        new_player.player_id = 1
        expect(new_player.valid?).to be false

        new_player.user_team_id = 2
        expect(new_player.valid?).to be true
      end
    end
end
