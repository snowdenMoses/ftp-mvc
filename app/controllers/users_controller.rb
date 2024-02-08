class UsersController < AdminController
  before_action :set_user, only: [:show, :update, :edit]
  def index
    @users = User.includes(:personal_detail).order(created_at: :desc).paginate(page: params[:page], per_page: 15)
  end

  def show

  end

  def edit
    @user = {
      email: @user.email,
      gender: @user&.personal_detail&.gender
    }
  end

  def update

  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
    raise Record::NotFound, 'record not found' if @user.nil?
  end
end

