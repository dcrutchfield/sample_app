require 'spec_helper'

describe "Static pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit static_pages_home_path
      page.should have_selector('h1', :text => 'Sample App')
    end
    it "should have the base title" do
      visit static_pages_home_path
      page.should have_selector('title', :text => "#{base_title}")
    end
    it "should not have the content 'Home'" do
      visit static_pages_home_path
      page.should_not have_selector('title', :text => "Home")
    end
  end
  
  describe "Help page" do
    it "should have the content 'Help'" do
      visit static_pages_help_path
      page.should have_selector('h1', :text => 'Help')
    end
    it "should have the title containing 'Help'" do
      visit static_pages_help_path
      page.should have_selector('title', :text => "#{base_title} | Help")
    end
  end
  
  describe "About page" do
    it "should have the content 'About Us'" do
      visit static_pages_about_path
      page.should have_selector('h1', :text => 'About Us')
    end
    it "should have the title containing 'About Us'" do
      visit static_pages_about_path
      page.should have_selector('title', :text => "#{base_title} | About Us")
    end
  end
  
  describe "Contact page" do
    it "should have the content 'Contact'" do
      visit static_pages_contact_path
      page.should have_selector('h1', :text => 'Contact')
    end
    it "should have the title containing 'Contact'" do
      visit static_pages_contact_path
      page.should have_selector('title', :text => "#{base_title} | Contact")
    end
  end
end