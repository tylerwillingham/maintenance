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

  describe "GET #new" do
    it "returns http succes" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "assigns @vehicle to a new vehicle" do
      get :new
      expect(assigns(:vehicle)).to be_instance_of(Vehicle)
    end
  end

  describe "POST #create" do
    it "creates a new vehicle" do
      expect do
        post :create, vehicle: attributes_for(:vehicle)
      end.to change { Vehicle.count }.by(1)
    end

    context "a vehicle is created successfully" do
      it "redirects to vehicles#index" do
        post :create, vehicle: attributes_for(:vehicle)
        expect(response).to redirect_to(vehicles_path)
      end
    end

    context "vehicle creation is unsuccessful" do
      it "redirects to vehicles#new" do
        post :create, vehicle: attributes_for(:vehicle).except(:year)
        expect(response).to render_template(:new)
      end
    end
  end
end
