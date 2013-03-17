require 'spec_helper'

describe HousingPreference do
  
  let(:user) { FactoryGirl.create(:user) }
  # let(:city) { City.new(name: "Austin", craigslist_prefix: "austin", neighborhoods: ["South Congress", "West Campus"]) }
  
  before { @pref = user.housingpreferences.build(min_rent: 500) }

  subject { @pref }

  it { should respond_to(:user) }
  it { should respond_to(:user_id) }
  its(:user) { should == user }
  
  # it { should respond_to(:city) }
  # it { should respond_to(:city_id) }
  # its (:city) { should == city }

  it { should respond_to(:neighborhood) }

  it { should respond_to(:apartment_type) }
  it { should respond_to(:bedrooms) }
  it { should respond_to(:bathrooms) }
  it { should respond_to(:min_rent) }
  it { should respond_to(:max_rent) }

  it { should respond_to(:additional_search_terms) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        HousingPreference.new(user_id: user.id)
      end.to raise_error(ActiveModel:MassAssigmentSecurity::Error)
    end
  end

end
