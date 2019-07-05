class UsersController < ApplicationController

	def index
	end
	
	def show
       
    end
	
	def change_role
		@users = User.all 
    end
   
    def update_role
    	email = params[:email].strip
        role = params[:role]

        user = User.find_by_email(email)
        print 'EMAIL', email, 'USER', user

        if !['admin', 'premium', 'standard'].include? role
            flash[:notice] = "Invalid role set for user"
            return redirect_to '/users/change-role'
        end
        
        user = User.find_by_email(email)
         if user == nil
         	flash[:notice] = "User is not found."
         	return redirect_to '/users/change-role'

         else
            user.role = role
            user.save
          end

         if user.save
    	  flash[:notice] = "User was updated."
    	  
        else
    	flash.now[:alert] = "There was an error updating the user. Please try again."
    	render :edit
    end


    end

end
