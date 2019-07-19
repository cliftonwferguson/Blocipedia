class CollaboratorsController < ApplicationController
	def create
	  @collaborator = Collaborator.new
	  @wiki = Wiki.find(params[:wiki_id])
  	  @collaborator.user = User.find_by(email: params[:collaborator][:user])
  	  @collaborator.wiki = @wiki
  	  p @collaborator
  	if @collaborator.save
  		flash[:notice] = "collaborator was saved."
  		redirect_to @wiki
  	else

  		flash.now[:alert] = "There was an error saving the collaborator.  Please try again."
  		redirect_to @wiki
  	 end
	end
    
    def new
      @collaborator = Collaborator.new
      @wiki = Wiki.find(params[:wiki_id])
      p @wiki
    end
end