require 'rails_helper'

RSpec.describe "Admin::FerrariCars", type: :request do
  before { admin_sign_in_as(create(:administrator)) }

  describe "GET /admin/ferrari_cars" do
    it "returns http success" do
      get admin_ferrari_cars_path
      expect(response).to be_success_with_view_check('index')
    end
  end

end
