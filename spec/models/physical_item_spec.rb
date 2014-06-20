require 'spec_helper'

describe PhysicalItem do
  describe :associations do
    it { should have_one(:donation).dependent(:destroy) }
  end

  it { should respond_to(:name)}
  it { should respond_to(:height) }
  it { should respond_to(:width) }
  it { should respond_to(:weight) }
end