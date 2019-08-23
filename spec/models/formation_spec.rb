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
        it 'requires some things' do
            f = Formation.new
            expect(f.valid?).to be false

            f.name = 'aa'
            expect(f.valid?).to be true

            # f.gks = 2
            # expect(f.valid?).to be false


        end
    end
end
