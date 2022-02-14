class CommentMailerPreview < ActionMailer::Preview
  def new_comment_email 
    CommentMailer.with(comment: Comment.first).
    new_comment_email
  end
end