class UserRegistrationsController < Devise::RegistrationsController
  layout "admin", only: [:new]
  def new
    super
    @user = User.new
  end

  def create
    # super
    @user.create(set_registration_params[:user_info])
    respond_to do |format|
        if @user.save
          # product_params[:categories].reject(&:empty?).each do |category_id|
          #   @product.category_products.create(category_id: category_id.to_i)
          # end
          format.html { redirect_to user_url(@user), notice: "Account has been created successfully." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  private

  def set_registration_params
    params.require(:user).permits( user_info: %i[email
                                                 status
                                                 terms_and_conditions
                                                 encrypted_password
                                                  ],
                                   personal_details_info: %i[ first_name
                                                              email
                                                              date_of_birth
                                                              phone_number
                                                              city
                                                              gender
                                                              status
                                                              last_name
                                                              terms_and_conditions])
  end
end
