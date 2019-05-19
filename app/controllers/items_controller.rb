class ItemsController < ApplicationController
    # before_action :move_to_index, exept: :index


    def index
        @items = Item.all
    end

    def new
        @item = Item.new
    end

    def create
        Item.create(name: item_params[:name], price: item_params[:price], user_id: current_user.id)

        user = User.create!(user_params)
        session[:user_id] = user.id
        redirect_to root_path
    end

    def move_to_index
        redirect_to action: :index unless user_signed_in?
    end

    private

    def item_params
        params.require(:item).permit(:name, :price)
    end

    def user_params
        params.require(:user).permit(email.address, :password, :avater)
    end
end
