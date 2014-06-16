class Comment < ActiveRecord::Base

  belongs_to :suggestion
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  validates :user_id, presence: { message: 'no current user' }
  validates :suggestion_id, presence: { message: 'no current user' }
  validates :body, presence: { message: 'required' },
                   length: { minimum: 16,
                             too_short: 'comment too short' }

end
