class AccessController < ApplicationController


before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  def index
    @admins = Admin.where(:username => session[:username]).first
    @accessories = Accessory.all
  end

  def login
  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
  		found_user = Admin.where(:username => params[:username]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end
  	if authorized_user
  		session[:user_id] = authorized_user.id
  		session[:username] = authorized_user.username
  		flash[:notice] = "You are now logged in."
  		redirect_to(:action => "index")
  	else
  		flash[:notice] = "Invalid username/password combination"
  		redirect_to(:action => "login")
  	end
  end

  def logout
  	session[:user_id] = nil
  	session[:username] = nil
  	flash[:notice] = "You are now logged out"
  	redirect_to(:action => "login")
  end

  
end
