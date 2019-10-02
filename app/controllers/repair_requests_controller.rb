class RepairRequestsController < ApplicationController

  def index
    
    @new = RepairRequest.new

    @RepairRequests = RepairRequest.all
  end
end

