class User::PostsController < User::ApplicationController
  def index
    @posts = current_user.posts
  end

  def show
    @post = current_user.posts.find_by(uuid: params[:uuid])
    @post.revisions.create(user: current_user) if @post.present? && !@post.revisions.exists?(user: current_user)
  end
end
