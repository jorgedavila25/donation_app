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

  describe :create do
    let(:user) {  FactoryGirl.create(:user, email: "user1@yahoo.com") }
    let(:params){
      {
        donation: {
          title: "Donate for a cause",
          message: "Everyone needs a helping hand at times",
          donation_variation: "Voucher",
          voucher_expiration_date: "2014-06-11",
          physical_item_primary_weight: "",
          experience_longitude: ""
        }
      }
    }
    let(:response) { post(:create, params)}

    before do
      sign_in user
      response
      user.reload
    end

    context "when donation_variation is Voucher" do
      it "should create a Voucher donation variation and assign it to donation that the user owns" do
        Voucher.last.expiration_date.should == user.donations.last.donation_variation.expiration_date
      end
    end
  end

  describe :show do
    let!(:donation) { FactoryGirl.create(:donation) }
    let(:params){  { id: donation.id } }
    let(:user) {  FactoryGirl.create(:user, email: "user2@yahoo.com") }
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