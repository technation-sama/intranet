class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /suggestions
  # GET /suggestions.json
  def index
    @new = Suggestion.new
    @suggestions = Suggestion.all
  end
  # GET /suggestions/1
  # GET /suggestions/1.json
  # GET /suggestions/1/edit
  def edit
  end

  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = Suggestion.new(suggestion_params)
    respond_to do |format|
      if @suggestion.save
        SuggestionMailer.new_suggestion(@suggestion).deliver_later
        flash[:success]= 'Thank you!! Your suggestion was submitted successfully.'
        format.html { redirect_to suggestions_url }
        format.json { render :show, status: :created, location: @suggestion }
      else
        format.html { redirect_to suggestions_url }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggestions/1
  # PATCH/PUT /suggestions/1.json
  def update
    respond_to do |format|
      if @suggestion.update(suggestion_params)
        format.html { redirect_to @suggestion, notice: 'Suggestion was successfully updated.' }
        format.json { render :show, status: :ok, location: @suggestion }
      else
        format.html { render :edit }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggestions/1
  # DELETE /suggestions/1.json
  def destroy
    @suggestion.destroy
    respond_to do |format|
      format.html { redirect_to suggestions_url, notice: 'Suggestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggestion
      @suggestion = Suggestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_params
      params.require(:suggestion).permit(:subject, :message)
    end

    def samafilter
        user_ip = IPAddr.new(request.remote_ip)
        # An array of IPs and IP ranges that should be allowed. Stored on the current user.
        allowed_ips = ENV["LINKS_SAMA"].split(",")
        # Validate IP only if allowed_ips array is set, otherwise there is no IP restriction

        if allowed_ips
            verified = false
            allowed_ips.each do |allowed_ip|
                allowed_ip = IPAddr.new(allowed_ip)
                if allowed_ip.include?(user_ip)
                    verified = true
                end
            end
            # Redirect back to main page if not verified
            unless verified

              redirect_to root_url, notice: "Can only access from Samasource office"
            end
        end
    end
end
