require 'spec_helper'

describe Listing do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:city) { FactoryGirl.create(:city) }
  let(:housing_preference) { FactoryGirl.create(:housing_preference) }

  before do
    user.housing_preferences << housing_preference
    @listing = housing_preference.listings.build(title: "Title",
                                                 respond_email: "emai@lcom.net",
                                                 url: "someurl.com",
                                                 bedrooms: 2,
                                                 cost: 2000)
  end

  subject { @listing }

  it { should respond_to :title }
  it { should respond_to :url }
  it { should respond_to :respond_email }
  it { should respond_to :bedrooms }
  it { should respond_to :cost }

  it { should respond_to :housing_preference }
  it { should respond_to :housing_preference_id }

  it { should respond_to :user }
  it { should respond_to :user_id }

  it { should be_valid }

  describe "without a title" do
    before { @listing.title = " " }
    it { should_not be_valid }
  end

  describe "without a url" do
    before { @listing.url = " " }
    it { should_not be_valid }
  end

  describe "without a respond_email" do
    before { @listing.respond_email = " " }
    it { should_not be_valid }
  end

  describe "without bedrooms" do
    before { @listing.bedrooms = " " }
    it { should_not be_valid }
  end

  describe "with non-numerical bedrooms" do
    before { @listing.bedrooms = " " }
    it { should_not be_valid }
  end

  describe "without a cost" do
    before { @listing.cost = " " }
    it { should_not be_valid }
  end


end
