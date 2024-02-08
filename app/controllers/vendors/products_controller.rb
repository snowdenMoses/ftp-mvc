class Vendors::ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy]

  layout "vendor"

  # GET /products or /products.json
  def index
    @products = Product.includes(:categories, user: :personal_detail).where(user_id: current_user.id).order(created_at: :desc).paginate(page: params[:page], per_page: 15)
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params.except(:categories))
    @product.user = current_user
    respond_to do |format|
      if @product.save
        product_params[:categories].reject(&:empty?).each do |category_id|
          @product.category_products.create(category_id: category_id.to_i)
        end
        format.html { redirect_to vendors_product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params.except(:categories, :images))
        product_params[:categories].reject(&:empty?).each do |category_id|
          @product.category_products.create(category_id: category_id.to_i)
        end
        format.html { redirect_to vendors_product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to vendors_products_url, notice: "Product was successfully deleted." }
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
    params.require(:product).permit(:name, :price, :stock, :description, categories: [], images: [])
  end

end
