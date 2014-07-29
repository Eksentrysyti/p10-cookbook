require 'bcrypt'

class User < ActiveRecord::Base

	validates :username, uniqueness: true
	validates :email, uniqueness: true

  has_many :ingredients

  include BCrypt

  def password
  	@password ||= Password.new(password_hash)
  end

  def password=(new_password)
  	@password = Password.create(new_password)
  	self.password_hash = @password
  end

end
