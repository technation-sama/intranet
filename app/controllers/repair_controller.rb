class RepairController < ApplicationController
  def new

  end

  def create
    render plain: params[:repair].inspect
  end
end
