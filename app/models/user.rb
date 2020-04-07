class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, :case_sensitive => false
  validates :password, presence: true, length: { minimum: 2}, confirmation: true


  def self.authenticate_with_credentials(email, password)
    no_whitespace = email.strip
    user = User.find_by_email(no_whitespace.downcase)
    user && user.authenticate(password)
  end
end
