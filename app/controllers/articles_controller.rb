class ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :edit, :update, :destroy]

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
	  @articles = Article.all
	  @last_articles = Article.all.order('created_at DESC')
    # @most_commented = Article.comments.count
  end

  def new
  	@article = Article.new
  end

  def create
	  @article = Article.new(article_params)

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

	  if @article.update(article_params)
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

end
