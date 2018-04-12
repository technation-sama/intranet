ActiveAdmin.register Poll do
  includes :user
  scope ->{1.month.ago.strftime("%B") << 1.month.ago.strftime("%Y")}, :current_month, default: true
  scope :all
  actions :all, :except => [:new,:destroy,:edit]
  
member_action :poll_comments, :method => :get do
    user = User.find params[:id]
    periodd = request.original_url.scan(/.*poll_comments\.(.*)/)[0].join(',').split(',').reverse!
    polls = user.polls.where(period: periodd)
    @page_title = "#{user.name}'s #{periodd.to_sentence} comments"
    render 'poll_show', locals: { poll: polls, period: periodd }
end



index do
user_count=controller.instance_variable_get(:@polls).map(&:user_id)
period=controller.instance_variable_get(:@polls).map(&:period).uniq.join(",")
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
        period
      end
      actions defaults: false do |poll|
        item 'View all comments', poll_comments_admin_poll_path(poll,period), class: 'member_link'
      end
    end
    
end
csv do
  column("Nominee Name") { |user| user.user.name }
  column ("Comment"){|poll| poll.body}
  column ("Project Name"){|poll| poll.project_name}
  column ("Voting Month"){|poll| poll.period}
  column ("Comments"){|poll| poll.body}
end
filter :user
filter :period, as: :select
end
