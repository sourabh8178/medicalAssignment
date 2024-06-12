class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user.doctor? ? doctors_dashboard_path : receptionists_dashboard_path
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out!'
  end
end
