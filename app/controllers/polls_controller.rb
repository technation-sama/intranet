class PollsController < ApplicationController
  before_action :set_poll, only: [:edit, :update]

  # GET /polls
  # GET /polls.json
  def index
     @poll = Poll.new
     @users=User.all
    if current_user
      @voted=Poll.where('period = ? AND voter_id = ?', set_period,current_user.id).count
    end
  end

  # GET /polls/1/edit
  def edit
  end
# method to populate highcharts data
  def chart
    polls= Poll.where(period: set_period).map(&:user_id).uniq
    users=User.where('id IN (?)', polls).order(polls_count: :desc).limit(5)
    all = users.collect{|user|
        [user.name, 
         user.polls_count
        ]}
        render json: all
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.period=set_period
    @poll.voter_id=current_user.id
    respond_to do |format|
      if @poll.save 
        flash[:success]= 'You have successfully voted.'
        format.html { redirect_to polls_url}
        format.json { render :show, status: :created, location: @poll }
      else
        flash[:error] =@poll.errors.full_messages.join("\n")
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
