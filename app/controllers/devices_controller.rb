class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def index
		@objects = Device.order(sort_column + ' ' + sort_direction).page(params[:page])
  end

  def new
    @device = Device.new
  end

	def show
	end

  def edit
  end

  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to devices_path, notice: t('devices.create') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to devices_path, notice: t('devices.update') }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url }
    end
  end

	private
	def set_device
		@device = Device.find(params[:id])
	end

	def device_params
		params.require(:device).permit(:name, :description, :ip, :os, :saved, :infrastructure, :user_id, :environment, :virtual, :hypervisor_id, :service)
	end

	def sort_column
		Device.column_names.include?(params[:sort]) ? params[:sort] : "name"
	end 

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
	end 

end
