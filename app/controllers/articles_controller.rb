class ArticlesController < ApplicationController
#retrive an article and srore in instance variable
    def show
        @article = Article.find(params[:id])
    end
#get all articles using .each
    def index
        @articles = Article.all
    end

    def new
        #initiate @article variable
        @article = Article.new
    end

    def create
      #for testing:  render plain: params[:article]
      @article = Article.new(params.require(:article).permit(:title, :description))
    
      #check if save happened
      if
      @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
      else
        render 'new'
    end
end
end