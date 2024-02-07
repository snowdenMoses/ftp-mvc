class ProfileInformationController < ApplicationController
  include LayoutRouter
  def index
    @user = User.includes(:personal_detail).find(current_user.id)
    layout_switcher
  end

  private

  def layout_switcher
    layout_passthrough(current_user)
  end
end
