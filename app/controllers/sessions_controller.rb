class SessionsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    render :'sessions/login'
  end

  def create
    if params[:name].blank?
      redirect_to new_session_path
    else
      session[:name] = params[:name]
      redirect_to secret_path
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end

  private

  def require_login
    redirect_to new_session_path unless session.include? :name
  end

end