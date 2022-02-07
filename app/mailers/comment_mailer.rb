class CommentMailer < ApplicationMailer
  def new_comment_email
    @comment = params[:comment]
    mail(to: "mirciu.99@yahoo.com", subject: "There's a new comment!")
  end
end