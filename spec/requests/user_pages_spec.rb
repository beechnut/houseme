require 'spec_helper'

describe "User pages" do
  
  subject { page }

  describe "signup page" do
    before { visit signup_path }
    
    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: 'Sign up') }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "signup" do

    let(:carrier) { FactoryGirl.create(:carrier) }
    let(:submit) { "Create my account" }

    before do
      visit signup_path
    end
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name", with: "Test User"
        fill_in "Email", with: "test@sbmail.com"
        fill_in "Password", with: "password"
        fill_in "Confirm Password", with: "password"
        check "I want to receive text alerts for new housing."
        fill_in "Mobile", with: "1234567890"
        select carrier.name, from: "user_carrier_id"
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email("test@sbmail.com") }

        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: "signed up") }
        it { should have_link "Sign out" }
        
        describe "followed by signout" do
          before { click_link "Sign out" }
          it { should have_link "Sign in" }
        end
      end
    end

    describe "edit" do
      let(:user) { FactoryGirl.create(:user) }
      
      before do
        sign_in user
        visit edit_user_path(user)
      end

      describe "page" do
        it { should have_selector('h1', text: "Update your profile") }
        it { should have_selector('title', text: "Edit user") }
        it { should have_link('change', href: 'http://gravatar.com/emails') }
      end

      describe "with invalid information" do
        before { click_button "Save changes" }
        it { should have_content('error') }
      end

      describe "with valid information without phone info" do
        let(:new_name)  { "New Name" }
        let(:new_email) { "new@example.com" }

        before do
          fill_in "Name", with: new_name
          fill_in "Email", with: new_email
          fill_in "Password", with: user.password
          fill_in "Confirm Password", with: user.password
          click_button "Save changes"
        end

        it { should have_selector('title', text: new_name)}
        it { should have_selector('div.alert.alert-success') }
        it { should have_link('Sign out', href: signout_path) }
        specify { user.reload.name.should == new_name }
        specify { user.reload.email.should == new_email }
      end
    end

    describe "profile page" do
      let(:user) { FactoryGirl.create(:user) }
      let(:city) { FactoryGirl.create(:city) }
      let!(:hp1) { FactoryGirl.create(:housing_preference, user: user, city: city, bedrooms: 2, bathrooms: 1, min_rent: 500) }
      let!(:hp2) { FactoryGirl.create(:housing_preference, user: user, city: city, bedrooms: 4, bathrooms: 2, max_rent: 900) }
      let!(:hp3) { FactoryGirl.create(:housing_preference, user: user, city: city, bedrooms: 2, bathrooms: 1, max_rent: 1000) }

      before { visit user_path(user) }

      it { should have_selector('h1', text: user.name) }
      it { should have_selector('title', text: user.name) }

      describe "housing preferences" do
        it { should have_content(hp1.min_rent) }
        it { should have_content(hp1.city.name) }
        it { should have_content(hp1.bedrooms) }
        it { should have_content(hp1.bathrooms) }
        it { should have_content(hp2.max_rent) }
        it { should have_content(hp2.city.name) }
        it { should have_content(hp2.bedrooms) }
        it { should have_content(hp2.bathrooms) }
        it { should have_content(user.housing_preferences.count) }
      end

      describe "link to create a housing preference" do
        describe "with fewer than three housing preferences" do
          before do
            user.housing_preferences[2].destroy
            visit user_path(user)
          end
          it { should have_link("Create a new housing preference", href: new_housing_preference_path) }
        end
        describe "with three housing preferences" do
          it { should_not have_link("Create a new housing preference", href: new_housing_preference_path) }
        end
      end
    
    end
  end
end
