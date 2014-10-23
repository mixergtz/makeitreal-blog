class MostCommentedController < ApplicationController
  def index
    @most_commented = Article.most_commented
  end
end
