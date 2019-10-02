class RepairRequestsController < ApplicationController

  def index
    
    @RepairRequest = RepairRequest.new
    @RepairRequests = RepairRequest.all
    
  end
end

