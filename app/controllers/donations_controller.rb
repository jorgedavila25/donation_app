class DonationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @donations = current_user.donations
  end

  def show
    @donation = Donation.find(params[:id])
  end
end
