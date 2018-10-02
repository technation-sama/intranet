class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        flash[:success] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
        # render json: request.env['omniauth.auth']
      else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
#        flash[:error] = @user.errors[:hd].join(' ')
       redirect_to root_path
      end
  end
#   def failure
#     flash[:error] =  I18n.t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: 'You didn\'t use a samasource email'
#     redirect_to root_path
#   end
end
