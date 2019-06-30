require 'spec_helper'

describe Api::V1::MatchesController do
    render_views

    describe 'GET index' do
        let! (:matches) { Fabricate.times(3, :match) }

        it 'returns json serialized matches' do
            get :index, format: :json
            expect(response.status).to eq 200

            returned_matches = JSON.parse(response.body)
            expect(returned_matches['matches'].count).to eq matches.count
        end
    end
end
