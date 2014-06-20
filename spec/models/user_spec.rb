require 'spec_helper'

describe User do
  describe :associations do
    it { should have_many(:donations).dependent(:destroy) }
  end

  it { should respond_to(:email) }
end
