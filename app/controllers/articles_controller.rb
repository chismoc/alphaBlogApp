class ArticlesController < ApplicationController
#retrive an article and srore in instance variable
    def show
        @article = Article.find(params[:id])
    end
end