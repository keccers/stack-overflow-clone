class Vote < ActiveRecord::Base
  attr_accessible :value, :votable_type, :votable_id
  validates_presence_of :user_id, :votable_id, :votable_type, :value
  validates_uniqueness_of :user_id, :scope => [:votable_id, :votable_type]
  
  belongs_to :user
  belongs_to :votable, polymorphic: true
end
