class RepairController < ApplicationController

  def show
    @repair = MaintainaceReport.find(params[:id])
  end

  def new

  end

  def create
    @repair = MaintainaceReport.new(repair_params)
    @repair.save
    redirect_to @repair
  end

  private
    def repair_params
      params.require(:repair).permit(:user_id, :location, :category, :description)
    end
end
