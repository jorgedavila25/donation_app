require 'spec_helper'

describe Experience do
  describe :associations do
    it { should have_one(:donation).dependent(:destroy) }
  end
  it { should respond_to(:primary_contact_name) }
  it { should respond_to(:longitude) }
  it { should respond_to(:latitude) }
end