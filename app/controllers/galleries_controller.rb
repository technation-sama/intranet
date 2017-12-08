class GalleriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  def index
    @galleries = Gallery.includes(:gallery_attachments)
  end

  def show
  end

  def new
    @gallery = Gallery.new
    @gallery_attachment = @gallery.gallery_attachments.build
  end

  def edit
  end

  def create
    @gallery = Gallery.new(gallery_params)    
    if @gallery.save
      if params[:gallery_attachments]
        params[:gallery_attachments]['photo'].each do |pic|
          @gallery_attachment = @gallery.gallery_attachments.create!(photo: pic)
        end
      end
      redirect_to gallery_gallery_attachments_path(@gallery)
    else
      render json: @gallery.errors, status: :unprocessable_entity 
    end    
  end

  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery }
      else
        format.html { render :edit }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to galleries_url, notice: 'Gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:title, gallery_attachments_attributes: [:id, :gallery_id, :photo])
    end
end
