class RepairController < ApplicationController

  def index

  end

  def new

  end

  def create
    render plain: params[:repair].inspect
  end
end
