class ArticlesController < ApplicationController

    #call set_article action before running these actions
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    #retrive an article and srore in instance variable
    def show
      #call set_article
    end

    #get all articles using .each
    def index
        @articles = Article.all
    end

    def new
        #initiate @article variable
        @article = Article.new
    end

    def edit
        #call set_article
    end

    def create
      #for testing:  render plain: params[:article]
      @article = Article.new(article_params)
      @article.user = User.first
    
      #check if save happened
      if
      @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
      else
        render 'new'
    end
end

def update
    #find article to edit
    #call set_article

    if
    @article.update(article_params)
    flash[:notice] = "Article was created successfully"
    redirect_to @article
    else
    render 'edit'
    end
    end

    
    def destroy
     #call set_article
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end

