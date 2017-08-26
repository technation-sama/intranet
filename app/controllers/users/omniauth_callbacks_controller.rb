class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        @type='success'
        sign_in_and_redirect @user, event: :authentication
        #redirect_to desired_path
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
        @type='error'
        redirect_to root_url, alert: @user.errors[:hd].join(' ')
      end
  end
  def failure
    flash[:notice] = "Authentication failed!"
    redirect_to root_path
  end
end
