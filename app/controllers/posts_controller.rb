class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new,:edit]
    def authenticate_user!
        unless logged_in?
          redirect_to posts_path
        end
    end
    def logged_in?
    !current_user.nil?
    end
    def top
    end
    def index
        @posts = Post.where.not(image: nil)
    end
    def new
        @post_new=Post.new
    end
    def edit
    end
    def create
    #     file = params[:image]
    # name = file.original_filename
    # # 出力先のパスを設定※今回は、public/docs配下に配置
    # output_path = Rails.root.join('public/upload', name)
    # # ファイルを出力
    # File.open(output_path, 'wb'){ |f| f.write(file.read) }
    #     @post = Post.new(shop: params[:shop],food: params[:food],name: params[:name],content: params[:content],image: params[:image])

    #     #@post.user_id = current_user.id
        @post_new=Post.new(post_params)
        @post_new.user_id=current_user.id
        if @post_new.save
            redirect_to("/posts")
        else
            render new_post_path
        end
    end 
    def edit
        @post=Post.find(params[:id])

    end
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
           redirect_to user_path(@post.user.id)
        else
          render post_path(@post)
        end
    end
    def search
        @posts = Post.where(food: params[:keyword])
        render "index"
    end
    private
    def post_params
    params.require(:post).permit(:name, :image, :shop, :food, :content)
  end
end
