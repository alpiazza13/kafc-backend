require 'spec_helper'

RSpec.describe PlayerStat, type: :model do
  describe 'model structure' do
    it 'has its columns' do
      expect(PlayerStat.column_names.include?('player_id')).to be true
      expect(PlayerStat.column_names.include?('stat_id')).to be true
      expect(PlayerStat.column_names.include?('match_id')).to be true
    end
  end

  describe 'validation' do
    let(:new_player) {Fabricate (:player)}
    let(:new_player_stat) {Fabricate (:stat)}
    let(:new_player_match) {Fabricate (:match)}

    it 'requires a player_id and stat_id and match_id' do
      player_stat = PlayerStat.new
      expect(player_stat.valid?).to be false

      player_stat.player_id = new_player.id
      expect(player_stat.valid?).to be false

      player_stat.stat_id = new_player_stat.id
      expect(player_stat.valid?).to be false

      player_stat.match_id = new_player_match.id

      expect(player_stat.valid?).to be true      
    end
  end
end
