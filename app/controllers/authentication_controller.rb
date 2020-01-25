# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  # return auth token once user is authenticated
  def authenticate
    auth_user = AuthenticateUser
                .new(auth_params[:email], auth_params[:password])
    auth_token = auth_user.call
    response = { user: auth_user.user, auth_token: auth_token }
    json_response response
  end

  def google_authenticate
    FirebaseIdToken::Certificates.request!
    FirebaseIdToken::Signature.verify(params[:google_token])
  end

  private

  def auth_params
    if params[:google_token].nil?
      params.permit %i[email password google_token]
    else
      google_oauth_params
    end
  end

  def google_oauth_params
    params[:google_token] = params[:google]
    User.create user_params
  end

  def user_params
    params.permit %i[name email password password_confirmation]
  end
end