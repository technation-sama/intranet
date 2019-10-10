class RepairController < ApplicationController
  def new
    @Maintainance_request = Maintainance_request.new
  end
end
