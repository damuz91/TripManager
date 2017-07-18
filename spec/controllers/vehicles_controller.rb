require "rails_helper"

RSpec.describe VehiclesController, :type => :controller do
	describe "GET #index" do
		it "responds successfully with an HTTP 200 status code" do

			get :index, format: :json

			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "retrieves all the vehicles" do
			FactoryGirl.create_list(:vehicle, 1)
			get :index, format: :json
			json = JSON.parse(response.body)

			expect(response).to be_success

			expect(json.length).to be > 1
		end
	end

	describe 'POST /vehicles.json' do
		vehicle = FactoryGirl.build(:vehicle)
		context 'new vehicle success' do
			before do
				post :create, {vehicle: {plate: vehicle.plate, color: vehicle.color, year: vehicle.year}}, format: :json
			end

			it 'creates a new vehicle' do
				expect(Vehicle.last.plate).to eq(vehicle.plate.upcase) # Because it upcase in before_save
			end
		end
	end
end