class SessionsController < ApplicationController
  def new

  end

  def create
    user_input_email = params[:name]
    user_input_password = params[:password]

    user = User.find_by(name: user_input_email)
    if user && user.authenticate(user_input_password)
      session[:user_id] = user.id
      redirect_to session_messages_url(session[:user_id])
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
