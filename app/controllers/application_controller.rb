class ApplicationController < ActionController::Base

  def index
  end

  def hello
    @posts = Post.find_each
  end


end
