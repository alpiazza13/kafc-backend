require 'spec_helper'

RSpec.describe LineupPlayer, type: :model do
    describe 'model structure' do
        it 'has its columns' do
            expect(LineupPlayer.column_names.include?('lineup_id')).to be true
            expect(LineupPlayer.column_names.include?('player_id')).to be true
            expect(LineupPlayer.column_names.include?('position_id')).to be true
        end
    end
    describe 'validation' do
        it 'requires three things' do
            p = LineupPlayer.new
            expect(p.valid?).to be false

            pp = Fabricate(:player)
            p.player_id = pp.id
            expect(p.valid?).to be false


            ll = Fabricate(:lineup)
            p.lineup_id = ll.id
            expect(p.valid?).to be false

            pos = Fabricate(:position)
            p.position_id = pos.id
            expect(p.valid?).to be true
        end
    end
end
