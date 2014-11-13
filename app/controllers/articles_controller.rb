class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  helper_method :author?
  before_action :authenticate_user!, except: [:index, :show]
  before_action :redirect_if_not_author, only: [:edit, :update, :destroy]
  before_action :redirect_if_not_writer?, only: [:new, :create]

  def index
    @articles = Article.all
    @last_articles = Article.all.order('created_at DESC')
    @most_commented = Article.most_commented
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
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if  @article.update(article_params)
      flash[:notice] = 'Artículo actualizado'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:alert] = 'Artículo eliminado'
    redirect_to articles_path
  end

  def my_posts
    @articles = current_user.articles
    render 'user_posts'
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def redirect_if_not_writer?
    unless current_user.is_writer
      flash[:alert] = 'No estas habilitado para crear articulos :('
      redirect_to articles_path
    end
  end

  def author?
    @article.user == current_user
  end

  def redirect_if_not_author
    unless author?
      flash[:alert] = 'No eres el autor de este artículo'
      redirect_to @article
    end
  end
end
