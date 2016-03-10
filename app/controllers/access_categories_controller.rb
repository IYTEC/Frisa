class AccessCategoriesController < ApplicationController

  
  before_action :confirm_logged_in
  def index
    @categories = AccessCategory.all
  end

  def show
    @category = AccessCategory.find(params[:id])
  end

  def new
    @category = AccessCategory.new
  end

  def create
    @category = AccessCategory.new(category_params)
    if @category.save
      flash[:notice] = "Category created successfully"
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def edit
    @category = AccessCategory.find(params[:id])
  end

  def update
    @category = AccessCategory.find(params[:id])
    if @category.update_attributed(category_params)
      flash[:notice] = "Category Updated successfully"
      redirect_to(:action => "show")
    else
      render("edit")
    end
  end

  def delete
    @category = AccessCategory.find(params[:id])
  end

  def destroy
    @category = AccessCategory.find(params[:id])
    if @category.destroy
      flash[:notice] = "Category Deleted successfully"
      redirect_to(:action => "index")
    else
      flash[:notice] = "Could not delete Category"
      render("index")
    end
  end


  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
