class CommentsController < ApplicationController

  def index
    
  end

  def delete
    
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'Comment saved'
      redirect_to action: :show
    else
      flash[:error] = 'Can\'t add Comment.'
      
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:text)
    end
    
  
end