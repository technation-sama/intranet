class MteamController < ApplicationController
  def index
    @new = Mteam.new
    @all = Mteam.all
  end
  
  def create
    @question = Mteam.new(mteam_params)
    respond_to do |format|
      if @question.save
        MteamMailer.new_mteam_mailer(@question).deliver_later
        flash[:success]= 'Thank you!! Your Question was submated successfully.'
        format.html { redirect_to mteam_index_url }
      else
        flash[:error] = @question.errors.details
        format.html { redirect_to mteam_index_url }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def mteam_params
      params.require(:mteam).permit(:title, :question)
    end
    
end
