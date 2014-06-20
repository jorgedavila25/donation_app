class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :donation_variation, polymorphic: true

  accepts_nested_attributes_for :donation_variation, :user
end