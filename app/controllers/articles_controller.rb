class ArticlesController < ApplicationController
    def index
      render 'articles/index'
      @articles = Article.all
    end
end