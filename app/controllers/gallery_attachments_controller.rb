class GalleryAttachmentsController < ApplicationController
  before_action :set_gallery_attachment, only: [:show, :edit, :update, :destroy]

  # GET /gallery_attachments
  # GET /gallery_attachments.json
  def index
    @gallery_attachments = GalleryAttachment.all
  end

  # GET /gallery_attachments/1
  # GET /gallery_attachments/1.json
  def show
  end

  # GET /gallery_attachments/new
  def new
    @gallery_attachment = GalleryAttachment.new
  end

  # GET /gallery_attachments/1/edit
  def edit
  end

  # POST /gallery_attachments
  # POST /gallery_attachments.json
  def create
    @gallery_attachment = GalleryAttachment.new(gallery_attachment_params)

    respond_to do |format|
      if @gallery_attachment.save
        format.html { redirect_to @gallery_attachment, notice: 'Gallery attachment was successfully created.' }
        format.json { render :show, status: :created, location: @gallery_attachment }
      else
        format.html { render :new }
        format.json { render json: @gallery_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gallery_attachments/1
  # PATCH/PUT /gallery_attachments/1.json
  def update
    respond_to do |format|
      if @gallery_attachment.update(gallery_attachment_params)
        format.html { redirect_to @gallery_attachment, notice: 'Gallery attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery_attachment }
      else
        format.html { render :edit }
        format.json { render json: @gallery_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gallery_attachments/1
  # DELETE /gallery_attachments/1.json
  def destroy
    @gallery_attachment.destroy
    respond_to do |format|
      format.html { redirect_to galleries_url, notice: 'Gallery attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery_attachment
      @gallery_attachment = GalleryAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_attachment_params
      params.require(:gallery_attachment).permit(:gallery_id, :photo)
    end
end
