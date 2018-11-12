class CommentLikesController < ApplicationController
  def create
    @comment_like = CommentLike.new(comment: Comment.find(params[:comment_id]), comment_liker:current_user)

    if @comment_like.save
      render json: @comment_like, status: :created
    else
      render json: @comment_like.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment_like = CommentLike.find_by(comment: Comment.find(params[:comment_id]), comment_liker:current_user)
    @comment_like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_like
      @comment_like = CommentLike.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_like_params
      params.require(:comment_like).permit(:user_id, :comment_id)
    end
end
