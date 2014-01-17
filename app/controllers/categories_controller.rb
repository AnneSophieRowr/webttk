class CategoriesController < ApplicationController
  include Concerns::Search
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @objects = Category.order(Category.sort_column).page(params[:page])
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: t('category.create', name: @category.name) 
    else
      render action: 'new' 
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: t('category.update', name: @category.name) 
    else
      render action: 'edit' 
    end
  end

  def destroy
    name = @category.name
    @category.destroy
    redirect_to categories_url, notice: t('category.destroyed', name: name) 
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
