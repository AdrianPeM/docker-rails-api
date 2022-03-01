class V1::UsersController < ApplicationController
    before_action :find_user, only: [:show, :update, :destroy]
    
    #GET /v1/users
    def index
        render json: User.all
    end

    #POST /v1/users
    def create
        user = User.new(user_params)

        if user.save
            render json: user
        else
            render json: { error: "Unable to create User" }, status: :unprocessable_entity
        end
    end

    #GET /v1/users/:id
    def show
        render json: @user
    end

    #PUT /v1/users/:id
    def update
        if @user
            @user.update(user_params)
            render json: { message: "User succesfully updated." }, status: 200
        else
            render json: { error: "Unable to update User." }, status: :unprocessable_entity
        end
    end

    #DELETE /v1/users/:id
    def destroy
        if @user
            @user.destroy
            render json: { message: "User successfully deleted." }, status: 200
        else
            render json: { error: "Unable to delete User" }, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
    
    def find_user
        @user = User.find_by_id(params[:id])
    end
    
end
