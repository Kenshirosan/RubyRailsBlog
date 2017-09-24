class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            flash[:success] = "Article successfuly created!"
            redirect_to @article
        else
            flash[:error] = "Something went wrong, please try again in a few minutes!"
            render 'new'
        end
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
end
