class UsersController < ApplicationController
    def show
        # @items = Item.where(user_id: current_user.id)
        @user = User.find(current_user.id)
    end

    def edit
        @user = User.find(current_user.id)
    end

    def update
        @user = User.find(current_user.id)
        @user.nickname = user_params[:nickname]
        @user.email = user_params[:email]
        @user.save
        current_user.avatar.attach(user_params[:avatar])
        redirect_to user_path(current_user.id)
    end

    private

    def user_params
        params.require(:user).permit(:nickname, :email, :avatar)
    end
end
