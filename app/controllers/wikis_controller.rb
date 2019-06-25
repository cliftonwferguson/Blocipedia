class WikisController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @wikis = Wiki.all
  end

  def show
  	 @wiki = Wiki.find(params[:id])
  end

  def new
  	 @wiki = Wiki.new
  end
  
  def create
  	if not @wiki
  		@wiki = Wiki.new
  	end
  	@wiki.user = current_user

  	if @wiki.save

  		flash[:notice] = "wiki was saved."
  		redirect_to @wiki
  	else

  		flash.now[:alert] = "There was an error saving the Wiki.  Please try again."
  		render :new
  	 end
  end

  def edit
  	 @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
    	flash[:notice] = "Wiki was updated."
    	redirect_to @wiki
    else
    	flash.now[:alert] = "There was an error saving the wiki. Please try again."
    	render :edit
    end
 end
end
