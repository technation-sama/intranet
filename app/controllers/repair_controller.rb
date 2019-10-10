class RepairController < ApplicationController
  def new
    render plain: params[:repair].inspect
  end

end
