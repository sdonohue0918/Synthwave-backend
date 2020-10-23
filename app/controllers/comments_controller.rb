class CommentsController < ApplicationController
    def index
        comments = Comment.all

        render json: comments, include: :user, except: [:updated_at, :created_at]
    end

    def new
    end

    def create
        comment = Comment.create(comment_params)

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

    def comment_params
        params.require(:comment).permit(:user, :content)
    end
    
end
