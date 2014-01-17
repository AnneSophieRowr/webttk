class UsersController < ApplicationController
  include Concerns::Search
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @objects = User.order(sort_column + ' ' + sort_direction).page(params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = @user.decorate
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: t('user.create', name: @user.name) 
    else
      render action: 'new' 
    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    if @user.update(user_params)
      redirect_to users_path, notice: t('user.update', name: @user.name) 
    else
      render action: 'edit' 
    end
  end

  def destroy
    name = @user.name
    @user.destroy
    redirect_to users_url, notice: t('user.destroyed', name: name) 
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password, :password_confirmation, :remember_created_at, :admin)
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
  end 

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end 

end
