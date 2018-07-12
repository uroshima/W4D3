class SessionsController < ApplicationController
  
  def create 
    @user = User.find_by_credentials(
      params[:user][:user_name], 
      params[:user][:password]
    )
    
    if @user
      login!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] =  ['Credentials were wrong']
      render :new
    end
  end
  
  def new 
    render :new 
  end
  
  def destroy
    logout!
    redirect_to new_session_url
  end
end
