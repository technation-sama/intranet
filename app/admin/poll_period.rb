ActiveAdmin.register PollPeriod do
menu false

controller do
    skip_before_action :verify_authenticity_token
    def create
     current = Date.today.strftime("%B") << Date.today.strftime("%Y")
     pollperiod = PollPeriod.new
     pollperiod.period = current 
     pollperiod.active = true
    if pollperiod.save
      PollMailer.open_poll_email(current).deliver_later
      redirect_to admin_polls_path
    end

    end
    def update
      poll = PollPeriod.find(params[:id])
      poll.active = false
      if poll.save
        redirect_to admin_polls_path
      end
    end
end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :period, :active
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
