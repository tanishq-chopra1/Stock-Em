# frozen_string_literal: true

# This controller handles login authentication using google.
class SessionsController < ApplicationController
  def logout
    reset_session
    @current_user = nil
    redirect_to welcome_path, notice: 'You are logged out.'
  end

  skip_before_action :require_login, only: [:omniauth]
  def omniauth # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    auth = request.env['omniauth.auth']
    @user = User.find_or_create_by(user_id: auth['uid'], provider: auth['provider']) do |u|
      u.email = auth['info']['email']
      names = auth['info']['name'].split
      u.first_name = names[0]
      u.last_name = names[1..].join(' ')
    end

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'You are logged in.'
    else
      redirect_to welcome_path, alert: 'Login failed.'
    end
  end
end
