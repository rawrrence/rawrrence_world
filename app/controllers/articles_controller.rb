class ArticlessController < ApplicationController
  
  def index
    @articles = article.alphabetical.paginate(:page => params[:page]).per_page(10)
  end


  def show
    @article = article.find(params[:id])
  end


  def new
    @article = article.new
  end


  def edit
    @article = article.find(params[:id])
  end


  def create
    @article = article.new(params[:article])
    if @article.save
      flash[:notice] = 'article was successfully created.'
      redirect_to article_path(@article)
    else
      render :action => "new"
    end
  end


  def update
    @article = article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = 'article was successfully updated.'
      redirect_to article_path(@article)
    else
      render :action => "edit"
    end
  end


  def destroy
    @article = article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
end
