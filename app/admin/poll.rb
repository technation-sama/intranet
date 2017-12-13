ActiveAdmin.register Poll do
  includes :user
  scope ->{Date.today.strftime("%B") << Date.today.strftime("%Y")}, :current_month, default: true
  scope :all
  actions :all, :except => [:new,:destroy,:edit]
  
before_filter :only => :index do
  @period = params[:q]
end


member_action :poll_comments, :method => :get do
    user = User.find params[:id]
    polls = user.polls
    @page_title = "#{user.name}'s poll comments"
    render 'poll_show', locals: { poll: polls }
end


index do
user_count=controller.instance_variable_get(:@polls).map(&:user_id)
users= controller.instance_variable_get(:@polls).map(&:user_id).uniq
    table_for User.where('id IN (?)', users)do
      column "Nominee Pic", :id do|user|
        image_tag user.image, height: '30px'
      end
      column "Nominee ", :id do |usr|
        link_to usr.name, poll_comments_admin_poll_path(usr)
      end
      column "Number of Votes",:id do |user|
        user_count.select {|e| e == user.id}.count
      end
      column "Voting Period",:id do |user|
        controller.instance_variable_get(:@polls).map(&:period).uniq.join(",")
      end
      actions defaults: false do |poll|
        item 'View all comments', poll_comments_admin_poll_path(poll), class: 'member_link'
      end
    end
    
end

filter :user
filter :period, as: :select
# config.clear_action_items!

end
