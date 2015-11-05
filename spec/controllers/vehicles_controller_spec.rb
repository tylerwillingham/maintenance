require 'rails_helper'

RSpec.describe VehiclesController, type: :controller do
  describe "GET #index" do
    it "assigns @vehicles" do
      vehicle1 = create :vehicle
      vehicle2 = create :vehicle

      get :index

      expect(assigns(:vehicles)).to include(vehicle1, vehicle2)
    end

    it "returns http success" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end
end
