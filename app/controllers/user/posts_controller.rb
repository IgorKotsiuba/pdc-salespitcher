class User::PostsController < User::ApplicationController
  def index
    @posts = ::Post.all
  end

  def show
    @post = ::Post.find_by(uuid: params[:uuid])
    @post.revisions.create(user: current_user) if @post.present? && !@post.revisions.exists?(user: current_user)
  end
end
