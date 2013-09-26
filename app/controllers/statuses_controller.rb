class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  def index
		@objects = Status.order(Status.sort_column).page(params[:page])
  end

  def new
    @status = Status.new
  end

  def edit
  end

  def create
    @status = Status.new(status_params)

    respond_to do |format|
      if @status.save
        format.html { redirect_to statuses_path, notice: 'Status was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to statuses_path, notice: 'Status was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @status.destroy
    respond_to do |format|
      format.html { redirect_to statuses_url }
    end
  end

  private
    def set_status
      @status = Status.find(params[:id])
    end

    def status_params
			params.require(:status).permit(:name, :description)
    end
end
