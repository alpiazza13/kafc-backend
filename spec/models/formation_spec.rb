require 'spec_helper'

RSpec.describe Formation, type: :model do
    describe 'model structure' do
        it 'has its columns' do
            expect(Formation.column_names.include?('name')).to be true
            expect(Formation.column_names.include?('gks')).to be true
            expect(Formation.column_names.include?('defs')).to be true
            expect(Formation.column_names.include?('mids')).to be true
            expect(Formation.column_names.include?('fwds')).to be true
        end
    end

    describe 'validation' do
        let!(:f) { Formation.new }

        it 'requires a valid name' do
            expect(f.valid?).to be false

            f.name = '4330'
            expect(f.valid?).to be false

            f.name = '631'
            expect(f.valid?).to be false

            f.name = '361'
            expect(f.valid?).to be false

            f.name = '550'
            expect(f.valid?).to be false

            f.name = '554'
            expect(f.valid?).to be false

            f.name = "433"
            expect(f.valid?).to be true
        end
        it 'must have position counts matching its name' do
            f.name = "433"
            expect(f.valid?).to be true

            f.gks = 2
            expect(f.valid?).to be false

            f.gks = 1
            expect(f.valid?).to be true

            f.defs = 5
            expect(f.valid?).to be false

            f.defs = 4
            expect(f.valid?).to be true

            f.mids = 4
            expect(f.valid?).to be false

            f.mids = 3
            expect(f.valid?).to be true

            f.fwds = 4
            expect(f.valid?).to be false

            f.fwds = 3
            expect(f.valid?).to be true
        end
    end
end
