require 'spec_helper'

describe "Authentication" do
  subject { page }
  let(:signin_label) { "Sign In" }
  
  describe "signin page" do
    before { visit signin_path }
    it { should have_selector "h1",    text: signin_label }
    it { should have_selector "title", text: full_page_title(signin_label) }
    
    describe "with invalid information" do
      before { signin }
      it { should have_selector "title",                 text: signin_label }
      it { should have_selector "div.alert.alert-error", text: "Invalid" }
      
      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
    
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { signin user }
      
      it { should have_selector "title",    text: user.name }
      it { should have_link "Profile",      href: user_path(user) }
      it { should have_link "Sign out",     href: signout_path }
      it { should_not have_link "Sign in",  href: signin_path }
      
      describe "followed by signout" do
        before { click_link "Sign out" }

        it { should have_link "Sign in" }
      end
    end
  end
end