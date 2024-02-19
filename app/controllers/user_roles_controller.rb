class UserRolesController < AdminController

  def show
    # user_roles = UserRole.includes(:roles,users: :personal_detail).where(role_id: params[:id]).order(created_at: :desc).paginate(page: params[:page], per_page:15)
  end

  def new
    @current_role = params[:current_role]
    @role_id = params[:role_id]
    @user_role = UserRole.new
  end

  def create
    user_id = User.find_by_email(user_role_params[:user_id]).id
    role_id = params[:role_id]
    user_role = UserRole.find_by(user_id: user_id, role_id: role_id)
    raise ActiveRecord::RecordNotUnique, "user already has this role" if user_role.present?

    @user_role = UserRole.new(user_id:, role_id:)
    respond_to do |format|
      if @user_role.save
        format.html { redirect_to role_path(@user_role.role), notice: "user was added successfully." }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    user_role = UserRole.find_by(user_id: params[:user_id], role_id: params[:id])
    user_role.destroy
    respond_to do |format|
      format.html {redirect_to role_path(user_role.role), notice: "Role has been successfully revoked"}
    end
  end

  private

  def user_role_params
    params.require(:user_role).permit(:role_id, :user_id)
  end

end
