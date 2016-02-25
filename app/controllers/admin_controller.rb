class AdminController < ApplicationController
  layout "admin"
  authorize_resource :admin
end
