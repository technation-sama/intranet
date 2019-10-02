class RepairRequestsController < InheritedResources::Base

  private

    def repair_request_params
      params.require(:repair_request).permit(:area, :category, :description)
    end
end

