ActiveAdmin.register Poll do
  includes :user
  scope ->{Date.today.strftime("%B") << Date.today.strftime("%Y")}, :current_month, default: true
  actions :all, :except => [:new,:destroy,:edit]
  
controller do
  def open_poll
    
  end
end

# collection_action :poll_comments, method: :get do
#   #logic
# end

member_action :poll_comments, :method => :get do
    user = User.find params[:id]
    polls = user.polls
    @page_title = "#{user.name}'s poll comments"
    render 'poll_show', locals: { poll: polls }
end



index(:paginate => false) do
users= controller.instance_variable_get(:@polls).map(&:user_id).uniq
    table_for User.where('id IN (?)', users).order(polls_count: :desc)do
      column "Project", :id do|user|
         image_tag user.image, height: '30px'
      end
      column "Nominee ", :id do |usr|
        link_to usr.name, poll_comments_admin_poll_path(usr)
      end
      column "Number of Votes",:polls_count
      actions defaults: false do |poll|
        item 'View all comments', poll_comments_admin_poll_path(poll), class: 'member_link'
      end
    end
    
end

show do
    # renders app/views/admin/posts/_poll_show.html.erb
  render 'admin/poll_show', { post: post }
end

filter :user
# config.clear_action_items!

end
