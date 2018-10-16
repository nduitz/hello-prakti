class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  

  def new
    @post = Post.new(title: 'Das ist ein Test')
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to action: :index
    else
      render :new
    end
  end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])

      if @post.update(post_params)
        redirect_to action: :index
      else
        render :edit
      end
    end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = 'Post deleted'
      redirect_to action: :index
    else
      flash[:error] = 'Can\'t delete Post'
      redirect_to action: :index
    end
  end

  private
    def post_params
      params.require(:post).permit(:text, :title)
    end
end
