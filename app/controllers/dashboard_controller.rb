class DashboardController < ApplicationController
  include LayoutRouter
  before_action :layout_switcher, only: :index

  def index;  end

  private

  def layout_switcher
    layout_passthrough(current_user)
  end
end
