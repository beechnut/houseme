require 'spec_helper'

describe Carrier do
  
  before { @carrier = Carrier.new(name: "Verizon", email_suffix: "vtext.com") }

  subject { @carrier }

  it { should respond_to(:name) }
  it { should respond_to(:email_suffix) }

  it { should be_valid }

  describe "when name is absent" do
    before { @carrier.name = " " }
    it { should_not be_valid }
  end

  describe "when email suffix is absent" do
    before { @carrier.email_suffix = " " }
    it { should_not be_valid }
  end

  # TODO: Add tests for email format

end
