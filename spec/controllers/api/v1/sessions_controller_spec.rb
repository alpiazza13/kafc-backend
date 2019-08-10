require 'spec_helper'

describe Api::V1::SessionsController do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'login' do
    it 'fails if the user cannot be found' do
      post :create, params: { user: { email: 'a@b.com', password: 'abc' } }, format: :json
      expect(response.status).to eq 401
    end

    it 'fails when the user is found and the password is incorrect' do
      user = Fabricate(:user, password: 'Password#1234', password_confirmation: 'Password#1234')
      post :create, params: { user: { email: user.email, password: 'nope' } }, format: :json
      expect(response.status).to eq 401
    end

    it 'works when the user is found and the password is correct' do
      user = Fabricate(:user, password: 'Password#1234', password_confirmation: 'Password#1234')
      post :create, params: { user: { email: user.email, password: 'Password#1234' } }, format: :json
      expect(response.status).to eq 200
    end
  end
end
