class GalleryAttachmentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_gallery
  
  def index
    @gallery_attachments = @gallery.gallery_attachments
  end

  def show
    @gallery_attachment = @gallery.gallery_attachments.find(params[:id])
  end

  def new
    @gallery_attachment = @gallery.gallery_attachments.build
  end

  def edit
    @gallery_attachment = @gallery.gallery_attachments.find(params[:id])
  end

  def create
    @gallery_attachment = @gallery.gallery_attachments.create(gallery_attachment_params)

    respond_to do |format|
      if @gallery_attachment.save
        format.html { redirect_to gallery_gallery_attachments_path(@gallery), notice: 'Gallery attachment was successfully created.' }
        format.json { render json, status: :created, location: @gallery }
      else
        format.html { render :new }
        format.json { render json: @gallery_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @gallery_attachment = @gallery.gallery_attachments.find(params[:id])
    
    respond_to do |format|
      if @gallery_attachment.update(gallery_attachment_params)
        format.html { redirect_to gallery_gallery_attachments_path(@gallery), notice: 'Gallery attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery_attachment }
      else
        format.html { render :edit }
        format.json { render json: @gallery_attachment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @gallery_attachment = @gallery.gallery_attachments.find(params[:id])
    @gallery_attachment.destroy
    
    respond_to do |format|
      format.html { redirect_to gallery_gallery_attachments_path(gallery), notice: 'Gallery attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_gallery
      @gallery = Gallery.find(params[:gallery_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_attachment_params
      params.require(:gallery_attachment).permit(:gallery_id, :photo)
    end
end
