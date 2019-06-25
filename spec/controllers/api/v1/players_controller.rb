require 'spec_helper'

describe Api::V1::PlayersController do
  render_views

  describe 'GET index' do
    let! (:teams) { Fabricate.times(3, :team) }

    it 'returns json serialized teams' do
      get :index, format: :json
      expect(response.status).to eq 200

      returned_teams = JSON.parse(response.body)
      expect(returned_teams['players'].count).to eq players.count
    end
  end
end