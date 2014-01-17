class StatusesController < ApplicationController
  include Concerns::Search
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  def index
    @objects = Status.order(Status.sort_column).page(params[:page])
  end

  def show
  end

  def new
    @status = Status.new
  end

  def edit
  end

  def create
    @status = Status.new(status_params)

    if @status.save
      redirect_to statuses_path, notice: t('status.create', name: @status.name) 
    else
      render action: 'new' 
    end
  end

  def update
    if @status.update(status_params)
      redirect_to statuses_path, notice: t('status.update', name: @status.name) 
    else
      render action: 'edit' 
    end
  end

  def destroy
    name = @status.name
    @status.destroy
    redirect_to statuses_url , notice: t('status.destroyed', name: name)
  end

  private
  def set_status
    @status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:name, :description)
  end
end
