require 'spec_helper'

describe Api::V1::PositionsController do
  render_views

  describe 'GET index' do
    let! (:positions) { Fabricate.times(3, :position) }

    it 'returns json serialized positions' do
      get :index, format: :json
      expect(response.status).to eq 200

      returned_positions = JSON.parse(response.body)
      expect(returned_positions['positions'].count).to eq positions.count
    end
  end
end
