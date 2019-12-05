# frozen_string_literal: true

##
# This class wraps a set of controllers to manage the "/authenticate/*" paths.
class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  ##
  # let a user to create an account.
  #
  # @return an authenticated token upon successful signup
  #
  # == Request
  # [POST] /signup {params}
  #
  # == Required parameters
  # [name] name provided by the user
  # [email] email address provided by the user
  # [password]
  # [password_confirmation]
  def create
    user = User.create! user_params
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response response, :created
  end

  def downloads
    ret = EbookReader.where(user_id: current_user)
    response = { downloads: ret, count: ret.size }
    json_response response
  end

  private

  def user_params
    params.permit %i[name email password password_confirmation]
  end
end
