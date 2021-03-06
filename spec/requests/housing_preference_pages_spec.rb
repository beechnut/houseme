require 'spec_helper'

describe "housing preference pages" do
  subject { page }

  describe "new housing preference page" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit new_housing_preference_path
    end

    it { should have_selector('h1',    text: "New Housing Preference") }
    it { should have_selector('title', text: "New Housing Preference") }
  end

  describe "edit housing preference page" do
    let(:user) { FactoryGirl.create(:user) }
    let(:housing_preference) { FactoryGirl.create(:housing_preference, user: user, city: City.find(1)) }
    before do
      sign_in user
      visit edit_housing_preference_path(housing_preference)
    end

    it { should have_selector('h1',    text: "Edit a Housing Preference") }
    it { should have_selector('title', text: "Edit Preference") }
  end

  describe "creating a housing preference" do
    
    let(:user) { FactoryGirl.create(:user) }
    let(:submit) { "Submit" }
    
    before do
      sign_in user
      visit new_housing_preference_path
    end

    describe "page" do
      it { should have_selector('h1',    text: "New Housing Preference") }
      it { should have_selector('title', text: "New Housing Preference") }
    end

    describe "with invalid information" do
      before do
        fill_in "Bathrooms", with: "jkl;"
        click_button "Submit"
      end
      it { should have_content('error') }
    end

    describe "with valid information" do
      before do
        select "Boston", from: "housing_preference_city_id"
        # select "Jamaica Plain", from: "neighborhood"
        fill_in "Bedrooms", with: 2
        fill_in "Bathrooms", with: 3
        select "room", from: "housing_preference_housing_type"
        fill_in "Maximum Rent", with: 500
        fill_in "Minimum Rent", with: 800
      end
      it "should create a housing_preference" do
        expect { click_button submit }.to change(user.housing_preferences, :count).by(1)
      end

      describe "after saving the housing preference" do
        before { click_button "Submit" }
        let(:housing_preference) { user.housing_preferences.first }

        it { should have_content( housing_preference.city.name ) }
        it { should have_content( housing_preference.housing_type ) }
        it { should have_content( housing_preference.min_rent ) }
        it { should have_content( housing_preference.max_rent ) }
        it { should have_selector('div.alert.alert-success', text: "added") }
        it { should have_link "Edit" }
        it { should have_link "Delete" }

        describe "followed by delete" do
          before { click_link "Delete" }
        end
      end
    end
  end

  describe "edit" do

    let(:user) { FactoryGirl.create(:user) }
    let(:city) { FactoryGirl.create(:city) }
    # FIXME: build this, because it's not saving as valid
    let(:housing_preference) { FactoryGirl.create(:housing_preference, city: city, user: user) }
    
    before do
      sign_in user
      visit edit_housing_preference_path(housing_preference)
    end

    describe "page" do
      it { should have_selector('h1',    text: "Edit a Housing Preference") }
      it { should have_selector('title', text: "Edit Preference") }
    end

    describe "with invalid information" do
      before do
        fill_in "Bedrooms", with: "asdf"
        click_button "Submit"
      end
      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_city) { "San Francisco" }
      let(:new_neighborhood) { "North Beach" }
      let(:new_bedrooms) { 4 }
      let(:new_bathrooms) { 2 }
      let(:new_housing_type) { "apartment" }
      let(:new_max_rent) { 1600 }
      let(:new_min_rent) { 1300 }

      before do
        select new_city, from: "housing_preference_city_id"
        # FIXME: neighborhoods /  select new_neighborhood, from: "Neighborhood"
        fill_in "Bedrooms", with: new_bedrooms
        fill_in "Bathrooms", with: new_bathrooms
        select new_housing_type, from: "housing_preference_housing_type"
        fill_in "Maximum Rent", with: new_max_rent
        fill_in "Minimum Rent", with: new_min_rent
        click_button "Submit"
      end

      it { should have_content( new_city ) }
      # FIXME: neighborhoods / it { should have_content( new_neighborhood ) }
      it { should have_content( new_min_rent ) }
      it { should have_content( new_max_rent ) }
      it { should have_selector('div.alert.alert-success') }
      # TODO: Add routes to links
      it { should have_link "Edit" }
      it { should have_link "Delete" }
    end
  end

end
