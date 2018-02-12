ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     # span I18n.t("active_admin.dashboard_welcome.welcome")
    #     # small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    
    columns do
      # column do
      #   panel "Recent Blog Posts" do
      #     ul do
      #       Post.take(5).map do |post|
      #         li link_to(post.title, adin_post_path(post))
      #       end
      #     end
      #   end
      # end

      column do
        panel "Employee of the month polls (#{1.month.ago.strftime("%B") << " "<< 1.month.ago.strftime("%Y")})" do
          d={}
          Poll.current_month.group(:user_id).count.each do|b,c|
             d[User.find(b).name]=c
          end
          div column_chart d, stacked: true, xtitle: "Employees", ytitle: "No of Votes"
        end
      end
    end
  end # content
end
