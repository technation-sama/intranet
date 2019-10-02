class RepairRequestsController < ApplicationController

  def index
    
    @repair_request = RepairRequest.new
    @repair_requests = RepairRequest.all
    
  end
  
  def new
    @repair_request = RepairRequest.new
  end
  
end

