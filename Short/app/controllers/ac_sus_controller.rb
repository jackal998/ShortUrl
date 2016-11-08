class AcSusController < ApplicationController
	def index
		@acsu = AcSu.new
	end
	def new
		if params[:id]
			@acsu = AcSu.find(params[:id])
		else
			@acsu = AcSu.last
		end
	end
	def show
		if targeturl = AcSu.find_by(:shorturl=>params[:id]).target
			redirect_to targeturl
		else
			redirect_to ac_sus_path
		end
	end
	def create
		if @acsu = AcSu.find_by(:target=>su_params[:target])
			redirect_to new_ac_su_path(:id => @acsu)
		else
			@acsu = AcSu.new(su_params)
			if @acsu.save
				AcSu.last.update(:shorturl => AcSu.last.id.to_s + sr_generation)
				redirect_to new_ac_su_path
			else
				render :index
			end
		end
	end

	private
	def su_params
		params.require(:ac_su).permit(:target)
	end
	def sr_generation
		sr = SecureRandom.base64(3)
	end
end