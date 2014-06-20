class PhysicalItem < ActiveRecord::Base
  has_one :donation, as: :donation_variation, dependent: :destroy
end