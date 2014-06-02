require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_secure_password
  has_many :suggestions
  has_many :comments

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
