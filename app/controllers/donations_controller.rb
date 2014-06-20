class DonationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @donations = current_user.donations
  end

  def new
    @donation = current_user.donations.new
  end

  def create
    @donation = current_user.donations.create!(title: params[:donation][:title], description: params[:donation][:description])
    if params[:donation][:donation_variation] == "Voucher"
      @donation.donation_variation = Voucher.create!(expiration_date: params[:donation][:voucher_expiration_date])
      @donation.save!
    elsif params[:donation][:donation_variation] == "Experience"
      @donation.donation_variation = Experience.create!(primary_contact_name: params[:donation][:experience_primary_contact_name],
                                                        longitude:params[:donation][:experience_longitude],
                                                        latitude: params[:donation][:experience_latitude] )
      @donation.save!
    elsif params[:donation][:donation_variation] == "Physical Item"
      @donation.donation_variation = PhysicalItem.create!(height:params[:donation][:physical_item_height],
                                                          width: params[:donation][:physical_item_width],
                                                          weight: params[:donation][:physical_item_weight])
      @donation.save!
    end
     redirect_to donations_url, status: 200
  end

  def show
    @donation = Donation.find(params[:id])
  end
end
