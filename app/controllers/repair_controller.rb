class RepairController < ApplicationController

  def index

  end

  def new

  end

  def create
    @maintainacereport = MaintainaceReport.new(repair_params)
    @maintainacereport.save
    redirect_to @maintainacereport
  end

  private
    def repair_params
      params.require(:repair).permit(user_id, :location, :category, :description)
    end
end
