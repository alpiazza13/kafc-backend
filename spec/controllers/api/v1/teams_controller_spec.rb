require 'spec_helper'

describe Api::V1::TeamsController do
  render_views

  describe 'GET index' do
    let! (:teams) { Fabricate.times(3, :team) }

    it 'returns json serialized teams' do
      get :index, format: :json
      expect(response.status).to eq 200

      returned_teams = JSON.parse(response.body)
      expect(returned_teams['teams'].count).to eq teams.count
    end
  end
end
