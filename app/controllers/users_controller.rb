class UsersController < ApplicationController
    include SessionsHelper

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            log_in @user
            flash[:success] = "Welcome to kickass blog!"
            redirect_to @user
        else
            flash[:error] = "Something went wrong, please try again in a few minutes!"
            render 'new'
        end
    end

    def destroy

    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password)
        end
end
