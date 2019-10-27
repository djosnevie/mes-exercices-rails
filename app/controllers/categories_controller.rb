class CategoriesController < ApplicationController

  before_action :set_categories, only: [:edit, :update, :show, :destroy]
  def new
  	@category = Category.new
  end

  def edit
  	
  end

  def update

  	@category.update(category_params)

  	redirect_to categories_path, success: "la catégorie à été modifiée avec success"

  end


  def index
  	#flash.now[:success] = "bonjour tout le monde"
  	@categories = Category.all
  end

  def show
  end

  def create
  	category = Category.create(category_params)
  	redirect_to categories_path, success: "la catégorie à été crée avec success"
  end

  def destroy
  	@category.destroy
  	redirect_to categories_path, success: "la catégorie à été supprimée avec success"
  end

  private

  def category_params

  	params.require(:category).permit(:name, :slug)

  end

  def set_categories
  	@category = Category.find(params[:id])
  end
end
