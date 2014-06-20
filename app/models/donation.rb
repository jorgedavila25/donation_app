class Donation < ActiveRecord::Base
  belongs_to :donation_variation, polymorphic: true
end