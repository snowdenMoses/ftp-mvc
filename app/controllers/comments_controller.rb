class CommentsController < ApplicationController

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new comments_params.merge(user_id: current_user.id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to customers_product_path(@commentable), notice: "Your comment has been made"}
      else
        format.html {redirect_to customers_product_path(@commentable), alert: "Your comment has not been created"}
      end
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end
end
