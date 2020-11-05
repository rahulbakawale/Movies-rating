class UsersController < ApplicationController
	before_action :find_user , only: [:show,:edit,:update,:destroy]
  before_action :require_singin , except: [:new, :create]
  before_action  :require_correct_user , only: [:edit, :destroy , :update]

  def index
    @users=User.all
	end


	def show
      @reviews = @user.reviews
      @likes = @user.likes
	end  

     
	def edit
	end
     

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'user has successfully updated!'
    else
     flash.now[:error]="Some Errors !"
     render :edit
    end 
  end



	def new
		@user=User.new()
	end



	def create
    @user=User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'user has successfully created!'	
	  else
	    flash.now[:error]='Some Errors !'
	    render :new
	  end  
	end

    

     def destroy
       @user.destroy
       redirect_to users_path, notice: 'user has successfully deleted!'
      end


	private 

	def find_user
        @user=User.find_by(slug: params[:id])
	end

	def user_params
       params.require(:user).permit(:name,:email,:password)
	end


   def require_correct_user
    unless current_user_admin?(@user)
      flash[:error]='you are not correct user'
      redirect_to root_path
    end
   end 

   
end
  