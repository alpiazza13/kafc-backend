require 'spec_helper'

describe Api::V1::PlayersController do
  render_views

  describe 'GET index' do
    let! (:players) { Fabricate.times(3, :player) }

    it 'returns json serialized players' do
      get :index, format: :json
      expect(response.status).to eq 200

      returned_players = JSON.parse(response.body)
      expect(returned_players['players'].count).to eq players.count
    end
  end
end