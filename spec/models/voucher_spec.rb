require 'spec_helper'

describe Voucher do
  describe :associations do
    it { should have_one(:donation).dependent(:destroy) }
  end
  it { should respond_to(:name) }
  it { should respond_to(:expiration_date) }
end