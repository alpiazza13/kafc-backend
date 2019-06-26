require 'spec_helper'

describe Api::V1::StatsController do
  render_views

  describe 'GET index' do
    let! (:stats) { Fabricate.times(3, :stat) }

    it 'returns json serialized stats' do
      get :index, format: :json
      expect(response.status).to eq 200

      returned_stats = JSON.parse(response.body)
      expect(returned_stats['stats'].count).to eq stats.count
    end
  end
end
