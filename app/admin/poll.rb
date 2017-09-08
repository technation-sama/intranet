ActiveAdmin.register Poll do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
current=Date.today.strftime("%B")<<Date.today.strftime("%Y")
users= Poll.where(period: current).map(&:user_id).uniq

index do
  panel "#{current} votes" do 
    table_for User.where('id IN (?)', users).order(polls_count: :desc)do
      column "Nominee ", :name
      column "Number of Votes",:polls_count
    end
  end
  panel "#{current} Graphical view" do	
    render 'polls/votercharts'
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
