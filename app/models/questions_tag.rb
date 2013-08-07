class QuestionsTag < ActiveRecord::Base
  validates_presence_of :question_id, :tag_id

  belongs_to :question
  belongs_to :tag
end
