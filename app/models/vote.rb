class Vote < ActiveRecord::Base
  validates_presence_of :user_id, :votable_id, :votable_type, :value
  
  belongs_to :user
  belongs_to :votable, polymorphic: true
end
