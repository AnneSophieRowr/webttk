class UsersController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  private
    def set_status
      @status = Status.find(params[:id])
    end

    def status_params
			params.require(:status).permit(:last_name, :first_name, :email, :password, :remember_created_at)
    end
end
