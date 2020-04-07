class UsersController < ApplicationController
  
  def new
  end

  def create
    if User.find_by_email(user_params[:email]).present?
      flash[:alert] = 'The email you enter already exists!'
      redirect_to '/signup'
    else
      user = User.new(user_params)
        if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
