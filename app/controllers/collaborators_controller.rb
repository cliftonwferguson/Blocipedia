class CollaboratorsController < ApplicationController
	def new
	  @collaborator = Collaborator.new
  	  @collaborator.user = User.find_by(email: params[:collaborator][:user])
  	  @collaborator.wiki = params[:collaborator][:wiki]
  	  p @collaborator
  	if @collaborator.save
  		flash[:notice] = "collaborator was saved."
  		redirect_to params[:collaborator][:wiki]
  	else

  		flash.now[:alert] = "There was an error saving the collaborator.  Please try again."
  		redirect_to params[:collaborator][:wiki]
  	 end
	end
end