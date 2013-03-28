require 'spec_helper'

describe HousingPreference do
  let(:user) { FactoryGirl.create(:user, mobile: nil, receive_text: false) }
  let(:city) { FactoryGirl.create(:city) }
  let(:housing_preference) { FactoryGirl.create(:housing_preference) }
  let(:listing) { FactoryGirl.create(:listing) }
  before do
    @housing_preference = user.housing_preferences.build(bedrooms: 2, max_rent: 800, housing_type: "apartment")
    @housing_preference.city =    city
    @housing_preference.listings << listing
  end

  subject { @housing_preference }

  it { should respond_to(:bedrooms) }
  it { should respond_to(:bathrooms) }
  it { should respond_to(:min_rent) }
  it { should respond_to(:max_rent) }
  
  it { should respond_to(:neighborhood) }
  it { should respond_to(:housing_type) }
  it { should respond_to(:additional_search_terms) }

  it { should respond_to(:city_id) }
  it { should respond_to(:city) }
  its(:city) { should == city }

  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should respond_to(:listings) }
  its(:listings) { should include(listing) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @housing_preference.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        HousingPreference.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "with an invalid housing type" do
    it "should be invalid" do
      housing_types = %w(basement sublet cupboard)
      housing_types.each do |invalid_type|
        @housing_preference.housing_type = invalid_type
        @housing_preference.should_not be_valid
      end
    end
  end

  describe "with a valid housing type" do
    it "should be valid" do
      housing_types = %w(room apartment)
      housing_types.each do |valid_type|
        @housing_preference.housing_type = valid_type
        @housing_preference.should be_valid
      end
    end
  end

end
