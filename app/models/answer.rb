class Answer < ActiveRecord::Base
  attr_accessible :text
  validates_presence_of :text, :question_id, :responder_id

  belongs_to :responder, class_name: "User"
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
end
