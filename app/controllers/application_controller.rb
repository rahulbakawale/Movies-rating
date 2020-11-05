class ApplicationController < ActionController::Base
   #add_flash_type :danger, :info, :warning, :success

   def time_date(date)
    return  date.strftime('%d/%B/%Y : %H:%M %p') if date
    "Coming Soon"
  end
  helper_method :time_date



   private
    def current_user
     User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
 
  def current_user_admin?(current_user)
    current_user.is_admin == true if current_user
    # if current_user
    #   current_user.is_admin
    # end
   end
   helper_method :current_user_admin?
   

   def require_singin
    unless current_user
      session[:desired_url]=request.url
     flash[:errors]="Please First Loin"
     redirect_to new_session_path
    end 
  end
  helper_method :require_singin

 
 
end   