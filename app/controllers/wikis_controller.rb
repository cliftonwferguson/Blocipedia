class WikisController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @wikis = Wiki.all
  end

  def show
  	 @wikis = Wiki.all
  end

  def new
  	 @wikis = Wiki.new
  end

  def edit
  end
end
