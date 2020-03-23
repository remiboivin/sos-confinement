class AdminController < ApplicationController
  load_and_authorize_resource :class => :admin
  check_authorization

  def index
  end
end
