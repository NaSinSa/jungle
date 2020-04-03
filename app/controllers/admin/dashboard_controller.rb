class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: Rails.configuration.admin_auth[:id], password: Rails.configuration.admin_auth[:password]

  def show
    @products = Product.all
    @categories = Category.all
  end
end
