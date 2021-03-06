require 'rails_helper'

RSpec.describe VehiclesController, type: :controller do
  let(:user) { create :user }
  let(:user2) { create :user, email: 'wonderwoman@gmail.com' }

  it { should use_before_action(:require_login) }

  describe "GET #index" do
    it "assigns @vehicles" do
      sign_in_as user
      vehicle1 = create :vehicle, owner: user
      vehicle2 = create :vehicle, owner: user
      someone_elses_vehicle = create :vehicle, owner: user2

      get :index

      expect(assigns(:vehicles)).to include(vehicle1, vehicle2)
      expect(assigns(:vehicles)).not_to include(someone_elses_vehicle)
    end

    it "returns http success" do
      sign_in_as user

      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http succes" do
      sign_in_as user

      get :new

      expect(response).to have_http_status(:success)
    end

    it "assigns @vehicle to a new vehicle" do
      sign_in_as user

      get :new

      expect(assigns(:vehicle)).to be_instance_of(Vehicle)
    end
  end

  describe "GET #edit" do
    it "returns a 200 (success)" do
      vehicle = create :vehicle, owner: user
      sign_in_as user

      get :edit, id: vehicle.id

      expect(response).to have_http_status(:success)
    end

    it "assigns @vehicle" do
      vehicle = create :vehicle, owner: user
      sign_in_as user

      get :edit, id: vehicle.id

      expect(assigns(:vehicle)).to eq(vehicle)
    end
  end

  describe "PUT #update" do
    it "updates a vehicle" do
      vehicle = create :vehicle, owner: user
      sign_in_as user
      new_mileage = vehicle.mileage += 19_000

      put :update, id: vehicle.id, vehicle: { mileage: new_mileage }

      vehicle.reload
      expect(vehicle.mileage).to eq(new_mileage)
      expect(response).to redirect_to(vehicles_path)
    end
  end

  describe "POST #create" do
    it "creates a new vehicle" do
      sign_in_as user

      expect do
        post :create, vehicle: attributes_for(:vehicle).merge(owner_id: user.id)
      end.to change { Vehicle.count }.by(1)
    end

    context "a vehicle is created successfully" do
      it "redirects to vehicles#index" do
        sign_in_as user

        post :create, vehicle: attributes_for(:vehicle).merge(owner_id: user.id)

        expect(response).to redirect_to(vehicles_path)
      end
    end

    context "vehicle creation is unsuccessful" do
      it "redirects to vehicles#new" do
        sign_in_as user

        post :create, vehicle: attributes_for(:vehicle).except(:year)

        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the vehicle record" do
      create :vehicle, owner: user
      vehicle2 = create :vehicle, owner: user
      sign_in_as user

      expect do
        delete :destroy, id: vehicle2.id
      end.to change { Vehicle.count }.by(-1)
    end
  end
end
