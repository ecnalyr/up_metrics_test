require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ParticipationsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Participation. As you add validations to Participation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.build(:participation).attributes
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:participation, user: nil).attributes
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ParticipationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all participations as @participations" do
      participation = Participation.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:participations)).to eq([participation])
    end
  end

  describe "GET #show" do
    it "assigns the requested participation as @participation" do
      participation = Participation.create! valid_attributes
      get :show, params: {id: participation.to_param}, session: valid_session
      expect(assigns(:participation)).to eq(participation)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Participation" do
        expect {
          post :create, params: {participation: valid_attributes}, session: valid_session
        }.to change(Participation, :count).by(1)
      end

      it "assigns a newly created participation as @participation" do
        post :create, params: {participation: valid_attributes}, session: valid_session
        expect(assigns(:participation)).to be_a(Participation)
        expect(assigns(:participation)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved participation as @participation" do
        post :create, params: {participation: invalid_attributes}, session: valid_session
        expect(assigns(:participation)).to be_a_new(Participation)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { duration_minutes: 30 }
      }

      it "updates the requested participation" do
        participation = Participation.create! valid_attributes
        put :update, params: {id: participation.to_param, participation: new_attributes}, session: valid_session
        participation.reload
        expect(assigns(:participation).duration_minutes).to eq(30)
      end

      it "assigns the requested participation as @participation" do
        participation = Participation.create! valid_attributes
        put :update, params: {id: participation.to_param, participation: valid_attributes}, session: valid_session
        expect(assigns(:participation)).to eq(participation)
      end
    end

    context "with invalid params" do
      it "assigns the participation as @participation" do
        participation = Participation.create! valid_attributes
        put :update, params: {id: participation.to_param, participation: invalid_attributes}, session: valid_session
        expect(assigns(:participation)).to eq(participation)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested participation" do
      participation = Participation.create! valid_attributes
      expect {
        delete :destroy, params: {id: participation.to_param}, session: valid_session
      }.to change(Participation, :count).by(-1)
    end
  end

end
