class User::PostsController < User::ApplicationController
  def index
    @posts = ::Post.all
  end

  def show
    binding.pry
    @post = ::Post.find_by(uuid: params[:uuid])
  end
end
