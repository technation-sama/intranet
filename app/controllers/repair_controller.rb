class RepairController < ApplicationController
  def new
    @maintainaceReport = MaintainaceReport.new
  end
end
