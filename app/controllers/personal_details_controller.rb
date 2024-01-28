class PersonalDetailsController < AdminController
  before_action :set_personal_detail, only: [:show,  :edit, :update]

  def index
    @personal_details = PersonalDetail.all.order(created_at: :desc)
  end

  def show

  end

  def edit; end

  def update
    respond_to do |format|
    if @personal_detail.update(personal_detail_params)
        format.html { redirect_to user_url(@personal_detail.user), notice: "Personal details was successfully updated." }
        format.json { render :show, status: :ok, location: @personal_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personal_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_personal_detail
    @personal_detail = PersonalDetail.find_by_id(params[:id])
  end

  def personal_detail_params
    params.require(:personal_detail).permit(:first_name, :last_name, :middle_name, :date_of_birth, :city, :gender, :phone_number)
  end
end
