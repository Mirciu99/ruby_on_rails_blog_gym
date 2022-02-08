class Apis::Articles::V1::ArticlesController < ApplicationController
  def index
    @article = []
    Article.all.each do |article|
      @article << formatted_article(article)
    end
    render json: @article
  end 

  def latest_article
    render json: formatted_article(Article.last)
  end

  private 

  def formatted_article(article)
    formatted_article_data = {
      title: article.title,
      body: article.body,
    }
    formatted_article_data
  end
end