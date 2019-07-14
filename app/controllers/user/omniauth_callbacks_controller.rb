# frozen_string_literal: true

class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    handle_login :linkedin
  end

  def github
    handle_login :github
  end

  def twitter
    handle_login :twitter
  end

  def google_oauth2
    handle_login :google_oauth2
  end

  def facebook
    handle_login :facebook
  end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  def omniauth
    request.env['omniauth.auth']
  end

  def handle_login(kind)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: kind.to_s) if is_navigational_format?
    else
      redirect_to new_user_registration_url
    end
  end
end
