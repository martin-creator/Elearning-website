class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
        @User = User.find_for_google_0auth2(request.env["omniauth.auth"], current_user)

        if @user.persited?
            flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
            sign_in_and_redirect @user, :event => authentication
        else
            session["devise_google_data"] = request.env["omniauth.auth"]
            redirect_to new_user_registration_url
        end
    end
end
