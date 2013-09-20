class AdsController < ApplicationController
	def new
		@ad = Ad.new(params[:ad])
		@ad.save
	end

	def show 
		@ad = Ad.find(params[:id])
	end

	def index 
		@ads = Ad.find(:all)
	end

	def create
		@ad = As.new(params[:ad])
		@ad.save
		redirect_to ad_path(@ad.id)
	end
end
