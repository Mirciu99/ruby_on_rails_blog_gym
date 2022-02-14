json.(@article,:id, :title, :body, :created_at, :updated_at, :status)

json.comments @article.comments, :id, :commenter, :body, :created_at