class AccessoriesController < ApplicationController

  
  before_action :confirm_logged_in
  
  def index
    @accessories = Accessory.all
  end

  def show
    @accessory = Accessory.find(params[:id])
  end

  def new
    @accessory = Accessory.new
    @access_category = AccessCategory.all
    @accessory_count = Accessory.count + 1
  end

  def create
    @accessory = Accessory.new(accessory_params)
    if @accessory.save
      flash[:notice] = "Accessory created successfully"
      redirect_to(:action => "index")
    else
      @access_category = AccessCategory.all
      @accessory_count = Accessory.count + 1
      render('new')
    end
  end

  def edit
    @accessory = Accessory.find(params[:id])
    @access_category = AccessCategory.all
    @accessory_count = Accessory.count
  end

  def update
    @accessory = Accessory.find(params[:id])
    if @accessory.update_attributes(accessory_params)
      flash[:notice] = "Accessory updated successfuly"
      redirect_to(:action => "show", :id => @accessory.id)
    else
      @access_category = AccessCategory.all
      @accessory_count = Accessory.count
      render("edit")
    end
  end

  def delete
    @accessory = Accessory.find(params[:id])
  end

  def destroy
    @accessory = Accessory.find(params[:id])
    if @accessory.destroy
      flash[:notice] = "Accessory deleted successfully"
      redirect_to(:action => "index")
    end
  end


  private
  def accessory_params
    params.require(:accessory).permit(:access_category_id, :feature, :price, :available, :other_info, :name, :photo)
  end
end
