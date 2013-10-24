module FeatureHelpers
  def log_in_as_admin(admin = create(:admin))
    visit new_admin_session_path
    page.should have_content "Sign in"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Sign in"
    page.should have_content 'Welcome'
    admin
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers
end