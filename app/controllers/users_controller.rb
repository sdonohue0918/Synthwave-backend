class UsersController < ApplicationController
    def index
        users = User.all

        render json: users, except: [:updated_at, :created_at]
    end

    def new
    end

    def create
        user = User.create(user_params)

        render json: user
    end

    def edit
        user = User.find_by(id: params[:id])
    end

    def update
        user = User.update(user_params)

        User.update!(user_params)

        render json: user
    end

    def delete
        user = User.find_by(id: params[:id])
        User.destroy!
    end
        
    private

    def user_params
        params.require(:user).permit(:name)
    end
    
end