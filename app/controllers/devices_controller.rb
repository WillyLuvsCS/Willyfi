class DevicesController < ApplicationController
	def index
    	@devices = Device.all
    end

    def new
   		 @device = current_user.devices.new(device_type: params[:device_type])
  	end

    def create
    	@device = current_user.devices.new(device_params)
    	if @device.save
      		redirect_to user_path(current_user), notice: "Device added successfully."
    	else
      		flash.now[:alert] = "Failed to add device."
      		render :new
    	end
    end

  private

  def device_params
    params.require(:device).permit(:device_name, :device_type, :last_used)
  end
end
