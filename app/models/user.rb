class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :about
  validates_presence_of :name, :email, :password, :password_confirmation, :about
  validates :email, format: {with: /.+@.+\..+/}, uniqueness: true

  has_many :questions, foreign_key: 'asker_id'
  has_many :answers, foreign_key: 'responder_id'
  has_many :comments, foreign_key: 'commenter_id'
  has_many :votes

end
