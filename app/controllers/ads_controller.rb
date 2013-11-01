class AdsController < ApplicationController
	
	before_filter :check_logged_in, :only => [:edit, :update, :destroy]

	def new
		@ad = Ad.new(params[:ad])
	end

	def show 
		@ad = Ad.find(params[:id])
	end

	def index 
		@ads = Ad.find(:all)
	end

	def create
		@ad = Ad.new(params[:ad].permit(:name,:description, :price, :seller_id, :email, :img_url))
		@ad.save
		redirect_to "/ads/#{@ad.id}"
	end

	def edit
		@ad = Ad.find(params[:id])
	end

	def update
		@ad = Ad.find(params[:id])
		@ad.update_attributes(params[:ad].permit(:name,:description, :price, :seller_id, :email, :img_url))
		redirect_to "/ads/#{@ad.id}"
	end

	def destroy
		@ad = Ad.find(params[:id])
		@ad.destroy
		redirect_to ads_path
	end

	private 
	   def check_logged_in
	   	authenticate_or_request_with_http_basic("Ads") do |username, password|
	   		username == "admin" && password == "123admin"
	   end
	end
end
