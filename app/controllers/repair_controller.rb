class RepairController < ApplicationController

  def show
    @repair = MaintainaceReport.find(params[:id])
  end

  def new

  end

  def create
    render plain: params[:repair].inspect
  end

  private
    def repair_params
      params.require(:repair).permit(:user_id, :location, :category, :description)
    end
end
