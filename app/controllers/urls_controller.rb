class UrlsController < ApplicationController
  def show
    @url = Url.search_for(params[:hash_code])		
  end

  def new
    @url = Url.new		
  end

  def create
    hash = rand(1000012312)
    @url = Url.new
    @url.link = params[:link]
    @url.hash_code = hash
    params[:hash_code] = hash
    if @url.save
      redirect_to "/#{@url.hash_code}"
    else
      render :new
    end  	
  end

  def preview
  	@url = Url.get_link(params[:link])
  end
end
