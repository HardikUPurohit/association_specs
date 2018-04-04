class User < ApplicationRecord
  validates_presence_of :password, :email
  
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'Please enter a valid email'
  validates :email, uniqueness: {message: 'This email is already registered with us.'}
end
