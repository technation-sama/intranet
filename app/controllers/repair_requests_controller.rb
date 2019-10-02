class RepairRequestsController < ApplicationController

  def index
    
    @new = Repair_request.new

    @Repair_requests = Repair_request.all
  end
end

