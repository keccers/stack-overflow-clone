class Tag < ActiveRecord::Base
  attr_accessible :text
  validates_presence_of :text

  has_many :questions_tags, dependent: :destroy
  has_many :questions, through: :questions_tags

end
