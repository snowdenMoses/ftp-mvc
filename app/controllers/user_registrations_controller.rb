class UserRegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
    @user.build_personal_detail
  end

  def create
    @user = User.new(set_registration_params)

    respond_to do |format|
      if @user.save
        sign_in(@user)
        format.html { redirect_to :home_root, notice: "Welcome! Your account has been created successfully." }
      else
        @user.build_personal_detail
        format.html { render "devise/registrations/new", status: :unprocessable_entity }
      end
    end
  end

  private

  def set_registration_params
    params.require(:user).permit(:email, :status, :terms_and_conditions,
                                 :password,
                                 personal_detail_attributes: [:first_name, :email, :date_of_birth,
                                                              :phone_number, :city, :gender, :status,
                                                              :last_name, :middle_name])
  end
end
