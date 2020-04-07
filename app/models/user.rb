class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 2}, confirmation: true


  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    user && user.authenticate(password)
  end
end
