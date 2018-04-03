class SessionsController < ApplicationController

  def new
    @users = User.all
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session
      session[:user_id] = user.id
      redirect_to articles_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def logout
    
  end

end
