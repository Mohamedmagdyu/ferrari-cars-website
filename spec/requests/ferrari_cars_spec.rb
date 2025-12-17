require 'rails_helper'

RSpec.describe "Ferrari cars", type: :request do

  # Uncomment this if controller need authentication
  # let(:user) { create(:user) }
  # before { sign_in_as(user) }

  describe "GET /ferrari_cars" do
    it "returns http success" do
      get ferrari_cars_path
      expect(response).to be_success_with_view_check('index')
    end
  end

  describe "GET /ferrari_cars/:id" do
    let(:ferrari_car_record) { create(:ferrari_car) }


    it "returns http success" do
      get ferrari_car_path(ferrari_car_record)
      expect(response).to be_success_with_view_check('show')
    end
  end


end
