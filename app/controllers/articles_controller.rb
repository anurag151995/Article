class ArticlesController < ApplicationController
  before_action :find_params , only: [:show,:edit]
  
  def index
    @articles = Article.all
  end
 
  def show
  end
 
  def new
    @article = Article.new
  end
 
  def edit
  end
 
  def create
    @article_last = Article.last
    @article = Article.new(article_params)
    @article.save
    redirect_to root_path
  end
 
  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
 
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
    def find_params
      @article = Article.find(params[:id])
    end
end