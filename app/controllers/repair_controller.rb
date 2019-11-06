class RepairController < ApplicationController
  

  def show
    @repair = MaintainaceReport.find(params[:id])
  end

  def new

  end

  def create
    @repair = MaintainaceReport.new(repair_params)
    @repair.save
    respond_to do |format|
      if @repair.save
        RepairMailer.new_repair(@repair).deliver_later
        flash[:success]= 'Thank you!! Your response was submitted successfully.'
        format.html { redirect_to new_repair_url }
        format.json { render :show, status: :created, location: @repair }
      else
        format.html { redirect_to new_repair_url }
        format.json { render json: @repair.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def repair_params
      params.require(:repair).permit(:user_id, :location, :category, :description)
    end
end
