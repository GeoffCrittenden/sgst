require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_secure_password
  has_many :suggestions
  has_many :comments

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
