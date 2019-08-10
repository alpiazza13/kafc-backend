require 'spec_helper'

RSpec.describe League, type: :model do
    describe 'model structure' do
        it 'has its columns' do
            expect(League.column_names.include?('manager_id')).to be true
            expect(League.column_names.include?('name')).to be true
        end
    end

    describe 'validation' do
        it 'requires a name' do
            new_user =  Fabricate(:user)
            new_league = League.new
            expect(new_league.valid?).to be false

            new_league.name = 'alex'
            expect(new_league.valid?).to be false

            new_league.manager_id = new_user.id
            expect(new_league.valid?).to be true

            new_league.name = nil
            expect(new_league.valid?).to be false
            
        end
    end

end
