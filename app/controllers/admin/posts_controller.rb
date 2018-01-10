class Admin::PostsController < Admin::ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = ::Post.all
  end

  def show
  end

  def new
    @post = ::Post.new
  end

  def edit
  end

  def create
    @post = ::Post.new(permitted_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_post_path(@post), notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(permitted_params)
        format.html { redirect_to admin_post_path(@post), notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: 'Post was successfully destroyed.' }
    end
  end

  private

  def set_post
    @post = ::Post.find(params[:id])
  end

  def permitted_params
    params.require(:post).permit(:title, :body, :attachments_cache, attachments: [])
  end
end
