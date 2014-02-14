class DevicesController < ApplicationController
  include Concerns::Search
  before_action :set_device, only: [:history, :show, :edit, :update, :sleep, :wake]

  def index
    @objects = Device.order(sort_column + ' ' + sort_direction).page(params[:page])
    respond_to do |format|
      format.html
      format.csv { send_data Device.to_csv }
    end
  end

  def new
    @device = Device.new
  end

  def show
    @device = @device.decorate	
  end

  def edit
  end

  def create
    @device = Device.new(device_params)

    if @device.save
      redirect_to devices_path, notice: t('device.create', name: @device.name) 
    else
      render action: 'new' 
    end
  end

  def update
    if @device.update(device_params)
      redirect_to devices_path, notice: t('device.update', name: @device.name) 
    else
      render action: 'edit' 
    end
  end

  def sleep
    @device.active = false
    @device.save
    redirect_to devices_url, notice: t('device.sleepy', name: @device.name) 
  end

  def wake
    @device.active = true
    @device.save
    redirect_to devices_url, notice: t('device.awake', name: @device.name) 
  end

  private
  def set_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:name, :description, :ip, :os, :saved, :infrastructure, :user_id, :environment, :virtual, :hypervisor_id, :service, :criticality)
  end

  def sort_column
    Device.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end 

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end 

end
