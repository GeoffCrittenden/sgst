class User < ActiveRecord::Base
  has_many :suggestions
  has_many :comments
end
