require 'factory_girl'

module QuestionHelper
  def create_question
    question = FactoryGirl.build(:question)
    question.asker_id = 1
    question.save
  end
end
