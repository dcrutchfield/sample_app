include ApplicationHelper

def signin(user = nil)
  fill_in "Email",    with: user.email unless user.nil? 
  fill_in "Password", with: user.password unless user.nil?
  click_button "Sign In"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector "div.alert.alert-error", text: message
  end
end