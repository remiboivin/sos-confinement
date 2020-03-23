class DashboardController < ApplicationController
  load_and_authorize_resource :class => :dashboard
  check_authorization

  def index
  end
end
