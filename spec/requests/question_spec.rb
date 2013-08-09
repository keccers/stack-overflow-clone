require 'spec_helper'

describe 'Question' do
include QuestionHelper
include AuthHelper

  describe 'index' do
    before do
      create_question
      visit root_url
    end

    it 'displays a list of question titles' do
      expect(page).to have_content('Why is the sky blue?')
    end

    it 'takes you to a question show page when you click on a question title' do
      FactoryGirl.create(:user)
      click_link('Why is the sky blue?')
      expect(page).to have_content('I think it would be much prettier')
    end
  end

  describe 'question show page' do

  end

  describe 'question create page' do
    before do
      visit root_url
    end

    context 'logged in' do
      before do
        login
        click_link('Create A New Question')
      end

      it 'should display a create question form' do
        expect(page).to have_content('Question Title')
      end

      context 'with valid input' do
        it 'should create a question on submit of the form' do
          expect {  fill_in 'question_title', with: 'New Title'
                    fill_in 'question_text', with: "New Content"
                    click_button "Create Question"
          }.to change(Question, :count).by(1)
        end

        it 'should redirect to the question page on create' do
          fill_in 'question_title', with: 'New Title'
          fill_in 'question_text', with: "New Content"
          click_button "Create Question"
          expect(page).to have_content('New Title')
        end
      end

      context 'with invalid input' do
        it 'should not create a question' do
          expect {  fill_in 'question_title', with: ''
                    fill_in 'question_text', with: ''
                    click_button "Create Question"
          }.to_not change(Question, :count)
        end

        it 'should show error messages' do
          fill_in 'question_title', with: ''
          fill_in 'question_text', with: ''
          click_button "Create Question"
          expect(page).to have_content("Title can't be blank")
        end
      end
    end

    context 'logged out' do
      it 'should redirect to the login page' do
        click_link('Create A New Question')
        expect(page).to have_content('Sign In')
      end
    end
  end
end