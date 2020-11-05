class SessionsController < ApplicationController
  def new
    
    end

    def create
      user = User.find_by(email: params[:email])
     if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       flash[:notice]="WelCome Back #{user.name}"
       redirect_to session[:desired_url] || user
         session[:desired_url]=nil 
      else
       flash.now[:error]= "Invalied Email&Password"
       render :new
      end 
    end

    def destroy 
      session[:user_id]=nil
      flash[:notice]="Successfully signed out ."
      redirect_to root_path
    end
end
