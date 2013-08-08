module AuthHelper
  def login
    user = FactoryGirl.create(:user)
    visit questions_url
    click_link "Sign In"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign In"
  end
end
