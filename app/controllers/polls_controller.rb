class PollsController < ApplicationController
  before_action :set_poll, only: [:edit, :update]

  # GET /polls
  # GET /polls.json
  def index
     @poll = Poll.new
     @users=User.all
    
  end

  # GET /polls/1/edit
  def edit
  end
  
  def create
    @poll = Poll.new(poll_params)
    @poll.period=Date.today.strftime("%B")<<Date.today.strftime("%Y")
    respond_to do |format|
      if @poll.save
        format.html { redirect_to polls_url, notice: 'Poll was successfully created.'}
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:user_id, :project_name, :body)
    end
end
