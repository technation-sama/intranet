ActiveAdmin.register Poll do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
current=Date.today.strftime("%B")<<Date.today.strftime("%Y")



index do
  panel "#{current} votes" do	
    table_for Poll.where(period: current) do
      column "Nominee", :user
      column "vote reasons", :body
      column "nominee Project",:project_name
      column "voting Period",:period
    end
  end
end

actions :all, :except => [:destroy, :update, :edit]
permit_params do
    params = [:user_id, :body, :project_name]
    # params.push :author_id if current_user.admin?
    params
end
filter :period, as: :select
config.clear_action_items!
end
