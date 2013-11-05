class UrlsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @url = Url.new		
  end

  def create
    # Url(id: integer, link: string, hash_code: integer, created_at: datetime, updated_at: datetime)
    @url = Url.new
    @url.link = params[:link]
    hash = rand(123)
    @url.hash_code = hash
    if @url.save
      redirect_to "/#{@url.hash_code}"  #get '/:hash_code', to: 'urls#show'
    else
      render :new
    end  	
  end

  def show
    new_hash =  (params[:hash_code]).to_s.slice(0..3)

    @url = Url.search_for(new_hash)
  end

  def preview
  	@url = Url.get_link(params[:link])
    redirect_to "http://" + @url.last.link || "https://" + @url.last.link 
  end
end
