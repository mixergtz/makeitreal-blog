class ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :edit, :update, :destroy]
  helper_method :is_author?
  before_action :authenticate_user!, except: [:index, :show]
  before_action :redirect_if_not_author, only: [:edit, :update, :destroy]
  before_action :is_writer?, only: [:new, :create]

  def index
    @articles = Article.all
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
      flash[:notice] = "Artículo actualizado"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    flash[:alert] = "Artículo eliminado"
    redirect_to articles_path
  end

  private

  def get_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:text)
  end

  def is_writer?
    unless current_user.is_writer
      flash[:alert] = "No estas habilitado para crear articulos :("
      redirect_to articles_path
    end
  end

  def is_author?
    @article.user == current_user
  end

  def redirect_if_not_author
    unless is_author?
      flash[:alert] = "No eres el autor de este artículo"
      redirect_to @article
    end
  end

end
