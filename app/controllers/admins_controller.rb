class AdminsController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :check_admin_type
  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = "Admin Created Successfully"
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      flash[:notice] = "Admin Updated Successfully"
      redirect_to(:action => "index")
    else
      render("edit")
    end
  end

  def delete
    @admin = Admin.find(params[:id])
  end

  def destroy
    @admin = Admin.find(params[:id])
    if @admin.destroy
      flash[:notice] = "Admin deleted Successfully"
      redirect_to(:action => "index")
    else
      render("index")
    end
  end

  def admin_params
    params.require(:admin).permit(:f_name, :l_name, :email, :admin_type, :username, :password)
  end

  private

  def check_admin_type
    @admin = Admin.where(:username => session[:username]).first
    if @admin.admin_type == "Regular"
      flash[:notice] = "Sorry you can't access this page"
      redirect_to(:controller => "admin")
    end
  end
end
