class AcSusController < ApplicationController
	def index
		@acsu = AcSu.new
	end
	def new
		@acsu = AcSu.last
	end

	def create
		@acsu = AcSu.new(su_params)
		if @acsu.save
			AcSu.last.update(:shorturl => AcSu.last.id.to_s + sr_generation)
			redirect_to new_ac_su_path
		else
			render :index
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