require 'spec_helper'

describe 'User' do
include AuthHelper
include QuestionHelper

  context "on homepage" do 
  before do
    visit questions_url
  end

    context "logged out" 
      it "can create a new user" do
        click_link "Sign Up"
        expect(current_path).to eql(new_user_path)
        expect(page).to have_content("Password confirmation")
      end

      it "can log in to the page" do
        click_link "Sign In"
        expect(current_path).to eql(login_path)
        expect(page).to have_field("Email")
      end

      it "can view a list of all questions" do
        @question = create_question
        visit questions_url
        expect(page).to have_selector("h3")
      end
    end

    context "logged in" do 
      before do
        login
      end

      it "can create a new question" do
        click_link "Create A New Question"
        expect(current_path).to eql(new_question_path)
        expect(page).to have_content("Question Title")
      end

      it "can view a list of all questions" do
        @question = create_question
        visit questions_url
        expect(page).to have_selector("h3")
      end

      it "can log out" do 
        click_link "Logout"
        expect(current_path).to eql(root_path)
      end
    end
  end
end
