class RepairController < ApplicationController
  def new
    @MaintainaceReport = MaintainaceReport.new
  end
end
