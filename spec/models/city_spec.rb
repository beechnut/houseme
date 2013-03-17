require 'spec_helper'

describe City do
  
  before do
    @city = City.new(name: "Boston", craigslist_prefix: "boston",
                     neighborhoods: ["Dorchester", "Jamaica Plain", "South End", "Back Bay"])
  end

  subject { @city }

  it { should respond_to(:name) }
  it { should respond_to(:craigslist_prefix) }
  it { should respond_to(:neighborhoods) }

  it { should respond_to(:craigslist_url) }

  it { should be_valid }

  describe "when name is absent" do
    before { @city.name = " " }
    it { should_not be_valid }
  end

  describe "when craigslist prefix is absent" do
    before { @city.craigslist_prefix = " " }
    it { should_not be_valid }
  end

  describe "when neighborhoods are absent" do
    before { @city.neighborhoods = [] }
    it { should_not be_valid }
  end

  describe "the craigslist url" do
    specify { @city.craigslist_url == "http://#{@city.craigslist_url}.craigslist.org" }
  end

end
