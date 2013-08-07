class Comment < ActiveRecord::Base
  validates_presence_of :text, :commentable_id, :commentable_type, :commenter_id

  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: "User"
end
