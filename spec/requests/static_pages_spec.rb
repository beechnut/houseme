require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    it "should have the content 'HouseMe'" do
      visit root_path
      page.should have_content ('HouseMe')
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit help_path
      page.should have_content ('Help')
    end
  end

end
