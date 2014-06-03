require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_secure_password
  has_many :suggestions
  has_many :comments

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  validates :first_name, presence: true,
                         length: { minimum: 2 }
  validates :last_name, presence: true,
                         length: { minimum: 2 }

  validates :password, presence: true,
                       confirmation: true
  validates :password_confirmation, presence: true,
                                    length: { in: 8..20,
                                    too_short: "must be at least 8 characters",
                                    too_long: "must be 20 characters or less" }

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
