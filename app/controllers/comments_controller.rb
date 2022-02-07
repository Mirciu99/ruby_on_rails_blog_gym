class CommentsController < ApplicationController
  #http_basic_authenticate_with name: "Admin", password: "admin", only: :destroy
  after_action :send_new_comment_alert, only: :create

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    respond_to do |format|
      if @comment.save
        format.html {redirect_to @article, notice: 'Comment was successfully created'}
      else
        format.html {render :_form}
      end
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: 303
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end

    def send_new_comment_alert
      CommentMailer.with(comment: @comment).new_comment_email.
      deliver_later
    end
end
