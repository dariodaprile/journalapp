class User < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :twitter_name
  has_many :posts
end
