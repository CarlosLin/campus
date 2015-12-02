class UsersController < ApplicationController
  before_action :authenticate_user!

  def info
  end
  
  def show
  end

  def history
  end
end
