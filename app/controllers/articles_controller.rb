class ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :edit, :update, :destroy]
  helper_method :is_author?
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :redirect_if_not_author, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
    @last_articles = Article.all.order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if	@article.save
      redirect_to @article
    else
      render "new"
    end
  end

  def show

  end

  def edit

  end

  def update

    if  @article.update(article_params)
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def get_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:text)
  end

  def is_author?
    @article.user == current_user
  end

  def redirect_if_not_author
    redirect_to @article unless is_author?
  end

end
