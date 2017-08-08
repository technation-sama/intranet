class CommentsController < ApplicationController
  #before_action :set_comment, only: [:show, :edit, :update, :destroy]
   before_action :set_comment, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  #before_filter :require_login
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = current_user.comments.build
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json

  def create
    #@comment = Comment.new(comment_params)

    #respond_to do |format|
      #if @comment.save
        #format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        #format.json { render :show, status: :created, location: @comment }
      #else
        #format.html { render :new }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      #end
    #end
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:post_id]

    @comment.save

    redirect_to post_path(@comment.post)
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    #check if the current comment exist and delete.
    @comment = Comment.find(params[:id])
    if @comment.present?
    @comment.destroy
    end
    respond_to do |format|
      format.html { redirect_to post_path(@comment.post), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  #upvote_from user
def upvote
  @comment.upvote_from current_user
  redirect_to request.referer
end

#downvote_from user
def downvote
  @comment.downvote_from current_user
  redirect_to request.referer
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user, :body)
    end
end
