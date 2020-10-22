class CommentsController < ApplicationController
    def index
        comments = Comment.all
        render json: comments, except: [:created_at, :updated_at]
    end

    def create
        comment = Comment.create(user: params[:user], content: params[:content])

        render json: comment
    end

    def edit
        comment = Comment.find_by(id: params[:id])
    end

    def update
        comment = Comment.update(comment_params)

        comment.update!(comment_params)

        render json: comment
    end

    def delete
        comment = Comment.find_by(id: params[:id])
        comment.destroy!
    end
        
    private

    def Comment_params
        params.require(:comment).permit(:user, :content)
    end
    
end
