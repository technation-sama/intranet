class PollsController < ApplicationController
  before_action :set_poll, only: [:edit, :update]

  # GET /polls
  # GET /polls.json
  def index
     @poll = Poll.new
     @users=User.all
    PollPeriod.is_poll_period_open.count == 1 ? @is_poll_active = true : @is_poll_active = false
    if current_user
      @voted=Poll.where('period = ? AND voter_id = ?', set_period,current_user.id).count
    end
  end

  # GET /polls/1/edit
  def edit
  end
 
  def create
    @poll = Poll.new(poll_params)
    @poll.period=set_period
    @poll.voter_id=current_user.id #used this since build will expect a user_id field i db
    respond_to do |format|
      if @poll.save 
        flash[:success]= 'You have successfully voted.'
        format.html { redirect_to polls_url}
        format.json { render :show, status: :created, location: @poll }
      else
        flash[:error] = flash[:error] =@poll.errors.messages.values.join("\n")
        format.html {redirect_to polls_url}
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end
    # function to set the voting period
    def set_period
      Date.today.strftime("%B") << Date.today.strftime("%Y") 
    end
    def last_month
      1.month.ago.strftime("%B") << 1.month.ago.strftime("%Y") 
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:user_id, :project_name, :body)
    end
end
