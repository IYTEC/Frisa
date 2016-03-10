class DevicesController < ApplicationController

  
  before_action :confirm_logged_in
  def index
    @devices = Device.all
  end

  def show
    @device = Device.find(params[:id])
  end

  def new
    @device = Device.new({:device_type => "Mobile Phone"})
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      flash[:notice] = "Device created successfully"
      redirect_to(:action => "index")
    else
      flas[:notice] = "Device could not be created"
      render("new")
    end
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])
    if @device.update_attributes(device_params)
      flash[:notice] = "Device updated successfully"
      redirect_to(:action => "show", :id => @device.id)
    else
      flash[:notice] = "Device could not be updated"
      render("edit")
    end
  end

  def delete
    @device = Device.find(params[:id])
  end

  def destroy
    @device = Device.find(params[:id])
    if @device.destroy
      flash[:notice] = "Device destroyed successfully"
      redirect_to(:action=> "index")
    else
      flash[:notice] = "Device could not be deleted"
      render("index")
    end
  end

  private
    def device_params
      params.require(:device).permit(:name, :model, :device_type, :description)
    end
end
