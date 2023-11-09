class ArticlesController < ApplicationController
  def get_articles
    num = params[:num].to_i
    articles = Article.first(num)
    puts articles.inspect
    render json: articles
  end
end
