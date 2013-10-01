class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
		@objects = User.order(sort_column + ' ' + sort_direction).page(params[:page])
  end

  def new
    @user = User.new
  end

	def show
	end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: t('users.create') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update

		if params[:user][:password].blank?
			params[:user].delete("password")
			params[:user].delete("password_confirmation")
		end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: t('users.update') }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
    end

  end
  private
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:last_name, :first_name, :email, :password, :password_confirmation, :remember_created_at)
	end

	def sort_column
		User.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
	end 

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end 

end
