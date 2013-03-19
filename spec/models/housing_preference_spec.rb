require 'spec_helper'

describe HousingPreference do
  let(:user) { FactoryGirl.create(:user, mobile: nil, receive_text: false) }
  let(:city) { FactoryGirl.create(:city) }
  before do
    @housingpreference = user.housing_preferences.build(bedrooms: 2, max_rent: 800)
    @housingpreference.city = city
  end

  subject { @housingpreference }

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

  it { should be_valid }

  describe "when user_id is not present" do
    before { @housingpreference.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        HousingPreference.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

end
