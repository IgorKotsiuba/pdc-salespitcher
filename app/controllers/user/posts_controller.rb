class User::PostsController < User::ApplicationController
  def index
    @posts = current_user.posts
  end

  def show
    @post = current_user.posts.find_by(uuid: params[:uuid])

    if @post.present? && !@post.revisions.exists?(user: current_user)
      @post.revisions.create(user: current_user)
      ActionCable.server.broadcast(
        'post_revisions', revision_count: @post.revisions.count, post_id: @post.id, users_count: @post.group.users.count
      )
    end
  end
end
