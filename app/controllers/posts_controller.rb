class PostsController < ApplicationController
  before_action :check_login, only: [:upvote, :downvote]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  # GET /posts
  # GET /posts.json
  def index
    if params[:tag]
      # filter posts by categories
      @posts = Post.tagged_with(params[:tag])
    else
      # change here if you need to add search
      @posts = Post.all
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    #justin >> creating a blank comment when the post loads, and assigning it current_post id
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post =  current_user.posts.build(post_params)
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

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
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
    #upvote_from user
  def upvote
    @post.upvote_from current_user
    redirect_to request.referer
  end

  #downvote_from user
  def downvote
    @post.downvote_from current_user 
    redirect_to request.referer 
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :image, :tag_list, :user_id)
    end
    
    def check_login
      redirect_to user_google_oauth2_omniauth_authorize_path if !current_user
    end
end
