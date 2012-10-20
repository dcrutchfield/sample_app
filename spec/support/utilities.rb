include ApplicationHelper

def sign_in(user = nil)
  visit signin_path
  unless user.nil?
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
  end
  click_button "Sign In"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector "div.alert.alert-error", text: message
  end
end