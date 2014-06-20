require 'spec_helper'

describe DonationsController do
  render_views

  describe :index do
    let!(:user) { FactoryGirl.create(:user_with_donations) }

    before do
      sign_in user
      get(:index)
    end

    it "should query all donations associated to user" do
      assigns(:donations).count.should be(5)
    end

    it "should render the index ok" do
      response.should be_ok
    end
  end

  describe :show do
    let!(:donation) { FactoryGirl.create(:donation) }
    let(:params){  { id: donation.id } }
    let(:user) {  FactoryGirl.create(:user, email: "idk@yahoo.com") }
    let(:response) { get(:show, params) }
    before do
      sign_in user
      user.donations << donation
      user.save!
      user.reload
      response
    end
    subject { response }

    it "should query the right donation with the passed id" do
      assigns(:donation).title.should eql(donation.title)
    end
  end
end