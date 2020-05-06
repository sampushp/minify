class UrlsController < ApplicationController
  def index
    @visits = Url.includes(:visits)
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.save
  end

  def show
    @url = Url.find_by_checksum(params[:checksum]) 
    visit = @url.visits.build(ip: request.remote_ip, country: request.location.try(:country))
    visit.save
    if @url.nil?
      render 'public/404'
    else
      redirect_to @url.original
    end
  end

  private

  def url_params
    params.require(:url).permit(:original)
  end
end
