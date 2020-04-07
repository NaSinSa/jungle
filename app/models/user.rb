class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 2}

  # def create
  #   if user = User.authenticate_with_credentials(params[:email], params[:password])
  #     # success logic, log them in
  #   else
  #     # failure, render login form
  #   end
  # # end
  # user = User.find_by_email(params[:email])
  # if user && user.authenticate(params[:password])
end
