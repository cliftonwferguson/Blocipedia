class WikisController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  after_action :verify_authorized, except: :index
  # after_action :verify_policy_scoped, only: :index

  def index
    @wikis = Wiki.all
  end

  def show
  	 @wiki = Wiki.find(params[:id])
     authorize @wiki
  end

  def new
      @wiki = Wiki.new
  end


  
  def create
  	@wiki = Wiki.new
  	@wiki.user = current_user
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
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
    authorize @wiki

    if @wiki.save
    	flash[:notice] = "Wiki was updated."
    	redirect_to @wiki
    else
    	flash.now[:alert] = "There was an error saving the wiki. Please try again."
    	render :edit
    end
 end

  def destroy
  	@wiki = Wiki.find(params[:id])

  	if @wiki.destroy
  		flash[:notice] = "\"#{@wiki.title}\"was deleted successfully."
  		redirect_to wikis_path
  	else
  		flash.now[:alert] = "There was an error deleting the wiki."
  		render :show
  	end
  end

end
