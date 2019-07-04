class UsersController < ApplicationController

	def index
	end
	
	def show
       
    end
	
	def change_role
    end
   
    def update_role
    	email = params[:email].strip!
        role = params[:role]

        if !['admin', 'premium', 'standard'].include? role
            flash[:notice] = "Invalid role set for user"
            return redirect_to '/users/change-role'
        end
    end

end
