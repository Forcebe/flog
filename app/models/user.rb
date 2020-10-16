class User < ApplicationRecord
  #account security
  has_secure_password

  # table associations
  has_many :logbooks
  has_many :flights, :through => :logbooks
end
