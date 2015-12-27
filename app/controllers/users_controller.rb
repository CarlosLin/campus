class UsersController < ApplicationController
	layout 'user'
  before_action :authenticate_user!

  def info
  end
  
  def show
  end

  def history
  end
end
