require 'spec_helper'

describe Api::V1::UsersController do
  render_views

  describe 'GET index' do
    let! (:users) { Fabricate.times(3, :user) }

    it 'returns json serialized users' do
      get :index, format: :json
      expect(response.status).to eq 200

      returned_users = JSON.parse(response.body)
      expect(returned_users['users'].count).to eq users.count
    end
  end
end
