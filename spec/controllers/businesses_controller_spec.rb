# require 'spec_helper'
# describe Api::V1::BusinessesController do
#   let(:valid_attributes) { {
#     "name" => "MyString" }
#   }

#   let(:valid_session) { {} } # This should return the minimal set of values that should be in the session

#   describe "GET index" do
#     it "assigns all businesses as @businesses" do
#       business = Business.create! valid_attributes
#       get :index, {}, valid_session
#       assigns(:businesses).should eq([business])
#     end
#   end

#   describe "GET show" do
#     it "assigns the requested business as @business" do
#       business = Business.create! valid_attributes
#       get :show, {:id => business.to_param}, valid_session
#       assigns(:business).should eq(business)
#     end
#   end

#   describe "GET new" do
#     it "assigns a new business as @business" do
#       get :new, {}, valid_session
#       assigns(:business).should be_a_new(Business)
#     end
#   end

#   describe "GET edit" do
#     it "assigns the requested business as @business" do
#       business = Business.create! valid_attributes
#       get :edit, {:id => business.to_param}, valid_session
#       assigns(:business).should eq(business)
#     end
#   end

#   describe "POST create" do
#     describe "with valid params" do
#       it "creates a new Business" do
#         expect {
#           post :create, {:business => valid_attributes}, valid_session
#         }.to change(Business, :count).by(1)
#       end

#       it "assigns a newly created business as @business" do
#         post :create, {:business => valid_attributes}, valid_session
#         assigns(:business).should be_a(Business)
#         assigns(:business).should be_persisted
#       end

#       it "redirects to the created business" do
#         post :create, {:business => valid_attributes}, valid_session
#         response.should redirect_to(Business.last)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns a newly created but unsaved business as @business" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         Business.any_instance.stub(:save).and_return(false)
#         post :create, {:business => { "name" => "invalid value" }}, valid_session
#         assigns(:business).should be_a_new(Business)
#       end

#       it "re-renders the 'new' template" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         Business.any_instance.stub(:save).and_return(false)
#         post :create, {:business => { "name" => "invalid value" }}, valid_session
#         response.should render_template("new")
#       end
#     end
#   end

#   describe "PUT update" do
#     describe "with valid params" do
#       it "updates the requested business" do
#         business = Business.create! valid_attributes
#         # Assuming there are no other businesses in the database, this
#         # specifies that the Business created on the previous line
#         # receives the :update_attributes message with whatever params are
#         # submitted in the request.
#         Business.any_instance.should_receive(:update).with({ "name" => "MyString" })
#         put :update, {:id => business.to_param, :business => { "name" => "MyString" }}, valid_session
#       end

#       it "assigns the requested business as @business" do
#         business = Business.create! valid_attributes
#         put :update, {:id => business.to_param, :business => valid_attributes}, valid_session
#         assigns(:business).should eq(business)
#       end

#       it "redirects to the business" do
#         business = Business.create! valid_attributes
#         put :update, {:id => business.to_param, :business => valid_attributes}, valid_session
#         response.should redirect_to(business)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns the business as @business" do
#         business = Business.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         Business.any_instance.stub(:save).and_return(false)
#         put :update, {:id => business.to_param, :business => { "name" => "invalid value" }}, valid_session
#         assigns(:business).should eq(business)
#       end

#       it "re-renders the 'edit' template" do
#         business = Business.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         Business.any_instance.stub(:save).and_return(false)
#         put :update, {:id => business.to_param, :business => { "name" => "invalid value" }}, valid_session
#         response.should render_template("edit")
#       end
#     end
#   end

#   describe "DELETE destroy" do
#     it "destroys the requested business" do
#       business = Business.create! valid_attributes
#       expect {
#         delete :destroy, {:id => business.to_param}, valid_session
#       }.to change(Business, :count).by(-1)
#     end

#     it "redirects to the businesses list" do
#       business = Business.create! valid_attributes
#       delete :destroy, {:id => business.to_param}, valid_session
#       response.should redirect_to(businesses_url)
#     end
#   end

# end
