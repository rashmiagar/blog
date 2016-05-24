class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:public_posts]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :publish, :share]

  def index
    @posts = current_user.posts.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def publish
    @post.published = true
    if @post.save
      redirect_to action: :public_posts
    end
  end

  def share
    @friends = current_user.friends
    UserMailer.share_post(@friends, @post).deliver_now!
    redirect_to action: :index
  end

  def public_posts
     @public_posts = Post.includes(:user).where('published = true').order(created_at: :desc).limit(10)

     render :public_posts
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :image_file, :remove_image, :published)
    end
end
