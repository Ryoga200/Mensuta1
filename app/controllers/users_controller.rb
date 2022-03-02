class UsersController < ApplicationController
    def show
        @user=User.find(params[:id])
        @user.introduction ||= ""
        @posts=Post.where(user_id: @user.id)
    end
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
           redirect_to user_path(@user.id)
        else
          render user_path(@user)
        end
    end
    private
    def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
