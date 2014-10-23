class LastArticlesController < ApplicationController
  def index
    @last_articles = Article.all.order('created_at DESC')
  end
end
