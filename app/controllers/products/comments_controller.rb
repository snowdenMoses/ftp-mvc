class Products::CommentsController < CommentsController
  before_action :set_product_comment, include: [:new, :create, :index]

  def set_product_comment
    @commentable = Product.find(params[:product_id])
  end
end
