class ProductsController < AdminController
  before_action :set_product, only: %i[ show edit update destroy product_full_detail ]

  # GET /products or /products.json
  def index
    authorize Product
    @products = Product.includes(:categories,user: :personal_detail).order(created_at: :desc).paginate(page: params[:page], per_page:15)
  end

  # GET /products/1 or /products/1.json
  def show
    authorize Product
  end


  # GET /products/new
  def new
    authorize Product
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    authorize Product
  end

  # POST /products or /products.json
  def create
    authorize Product
    @product = Product.new(product_params.except(:categories))
    @product.user = current_user
    respond_to do |format|
      if @product.save
        product_params[:categories].reject(&:empty?).each do |category_id|
          @product.category_products.create(category_id: category_id.to_i)
        end
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    authorize Product
    respond_to do |format|
      if @product.update(product_params.except(:categories))
        product_params[:categories].reject(&:empty?).each do |category_id|
          @product.category_products.create(category_id: category_id.to_i)
        end
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    authorize Product
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.includes(:user).find_by_id(params[:id])
      raise ActiveRecord::RecordNotFound, 'No record found' if @product.nil?
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :stock, :description , :state_id, categories: [], images: [])
    end
end
