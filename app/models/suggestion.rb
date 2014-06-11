class Suggestion < ActiveRecord::Base

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :comments

  validates :user_id, presence: { message: 'no current user' }
  validates :target, presence: { message: 'required' }
  validates :title, presence: { message: 'required' }
  validates :body, presence: { message: 'required' }
  validates :score, presence: { message: 'required' }

end
