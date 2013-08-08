class Question < ActiveRecord::Base
  attr_accessor :tag_list
  attr_accessible :title, :text, :tag_list
  validates_presence_of :title, :text, :asker_id

  belongs_to :asker, class_name: "User"
  has_many :answers
  belongs_to :best_answer, class_name: "Answer"
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :questions_tags
  has_many :tags, through: :questions_tags

  before_create :create_tag_list

  private

  def create_tag_list
    tag_list.split(",").each { |tag| tags << Tag.find_or_create_by_text(tag.strip) }
  end

end
