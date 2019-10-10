class RepairController < ApplicationController
  def new
    @maintainacereport = MaintainaceReport.new
  end
end
