ActiveAdmin.register Poll do
  includes :user
  scope ->{Date.today.strftime("%B") << Date.today.strftime("%Y")}, :current_month, default: true
  scope :all
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
# 
# current = 
# index do
# users= Poll.where(period: current).map(&:user_id).uniq
#   panel "#{current} votes" do 
#     table_for User.where('id IN (?)', users).order(polls_count: :desc)do
#       column "Nominee ", :name
#       column "Number of Votes",:polls_count
#     end
#   end
#   # panel "#{current} Graphical view" do	
#   #   render 'polls/votercharts'
#   # end
# end

# actions :all, :except => [:destroy, :update, :edit]
# permit_params do
#     params = [:user_id, :body, :project_name]
#     # params.push :author_id if current_user.admin?
#     params
# end
# filter :period, as: :select
users = :index
index as: :block do |user|
  h2  users
end
config.clear_action_items!
end
