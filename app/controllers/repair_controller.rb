class RepairController < ApplicationController

  def index
    @repairs = MaintainaceReport.all
  end
  def show
    @repair = MaintainaceReport.find(params[:id])
  end

  def new

  end

  def create
    @repair = MaintainaceReport.new(repair_params)
    @repair.save
    redirect_to action: "show", id: @repair.id
  end

  private
    def repair_params
      params.require(:repair).permit(:user_id, :location, :category, :description)
    end
end
