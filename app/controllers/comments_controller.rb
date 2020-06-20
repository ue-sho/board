class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to comment.board  # belongs_to をしているので対応したボードがわかる様になっている
    else
      redirect_to :back, flash: { # == redirect_back fallback_location: comment.board　（一つ前の画面に戻る）
        comment: comment,                             # flash[:comment] = comment
        error_messages: comment.errors.full_messages   # flash[:error_message] = comment.errors.full_messages
      }
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.board, flash: { notice: 'コメントが削除されました' }
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end
end
