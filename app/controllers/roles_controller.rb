class RolesController < AdminController
  before_action :set_role, only: [:show, :edit]

  def show
    @role = Role.find(params[:id])
    users_roles = UserRole.includes(:role, user: :personal_detail).where(role_id: params[:id])
                          .order(created_at: :desc)
                          .paginate(page: params[:page], per_page: 15)
    @users = users_roles.map do |user_role|
      user_role&.user
    end
  end

  def index
    @roles = Role.includes(:user_roles, users: :personal_detail).order(created_at: :desc).paginate(page: params[:page], per_page: 15)
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    respond_to do |format|
      if @role.save
        format.html { redirect_to roles_path, notice: "Role was successfully created." }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_role
    @roles = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:title)
  end
end
