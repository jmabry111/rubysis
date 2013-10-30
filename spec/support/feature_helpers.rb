module FeatureHelpers
  def log_in_as_admin(admin = create(:admin))
    section = FactoryGirl.create(:section)
    visit new_admin_session_path
    page.should have_content "Sign in"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Sign in"
    page.should have_content 'Signed in successfully.'
    admin
  end
  
  def log_in_as_teacher(teacher = create(:teacher))
    visit new_teacher_session_path
    page.should have_content "Sign in"
    fill_in "Email", with: teacher.email
    fill_in "Password", with: teacher.password
    click_button "Sign in"
    page.should have_content 'Signed in successfully.'
    teacher
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers
end