 class FavoritesController < ApplicationController
  include HTTParty

  def query
    @location = params[:display_address]
    yelp_key = ENV['YELP_API']
    url = "https://api.yelp.com/v3/businesses/search?term=ice+cream&location=#{@location}"
    response = HTTParty.get(
      url,
      headers: {
				Authorization: "Bearer " + yelp_key
				}
      )
      render :json => response
  end


  def show
    @user = User.find(params[:id])
    @fav = Favorite.where(:user_id => @user)
    render :json => @fav.as_json
  end


  def new
    @fav = Favorite.new
  end

  def create
    @fav = Favorite.new(favorite_params)
      if @fav.valid?
        @fav.save()
        render :json
      else
        render status: :bad_request, :json => {
        :errors => @fav.errors.messages
      }
    end
  end


  private

  def favorite_params
    params.require(:favorite).permit(:name, :url, :image_url, :rating, :display_address, :display_phone, :user_id)
  end


end
