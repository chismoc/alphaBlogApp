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
    end

    def create
        render plain: params[:article]
    end
end