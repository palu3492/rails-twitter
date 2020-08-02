class PostsController < ApplicationController
  http_basic_authenticate_with name: "Alex", password: "123", except: [:index, :show]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/:id
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new

  end

  # POST /posts
  def create
    # render plain: params[:post].inspect
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      # flash does not work when using redirect, need to use render
      # flash.now[:alert] = "Posts need to be between 1 and 280 characters"
      redirect_to new_post_path(@post)
    end
  end

  # GET /posts/:id/edit
  def edit
    @post = Post.find(params[:id])
  end

  # PATCH or PUT /posts/:id
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      redirect_to edit_post_path(@post)
    end
  end

  # DELETE /posts/:id
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private def post_params
    params.require(:post).permit(:title, :body)
  end
end
