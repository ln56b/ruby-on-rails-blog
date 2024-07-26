class CommentsController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "admin", only: [:destroy]

    def index
        @article = Article.find(params[:article_id])
        @comments = @article.comments
    end


    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private def comment_params
        params.require(:comment).permit(:author, :body, :status); 
    end
end
