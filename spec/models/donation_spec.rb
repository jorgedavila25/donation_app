require 'spec_helper'

describe Donation do
  describe :associations do
    it { should belong_to(:donation_variation) }
    it { should belong_to(:user) }
  end

  it { should respond_to(:title) }
  it { should respond_to(:description) }


end
