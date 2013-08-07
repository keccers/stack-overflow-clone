class Question < ActiveRecord::Base
  attr_accessible :title, :text
  validates_presence_of :title, :text, :asker_id

  belongs_to :asker, class_name: "User"
  has_many :answers
  has_one :best_answer, class_name: "Answer"
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :questions_tags
  has_many :tags, through: :questions_tags
end
