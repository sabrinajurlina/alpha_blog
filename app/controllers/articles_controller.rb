class ArticlesController < ApplicationController
  
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    #have to create a new article instance upon page load so that form can render with no errors
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created successfully."
      # redirect_to article_path(@article)
      # OR, this shorthand
      redirect_to @article
    else
      render 'new'
    end
    # to render object without a template/view...
    # render plain: @article.inspect
    # render plain: params[:article]
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end
end