class PermissionuserController < ApplicationController
	def index
		if user_signed_in? && current_user.rol == "admin" 
			@submenu=1
			@users = User.search1(params[:search]).page(params[:page]).per(5)
			#@users = User.where(:rol=>'user').page(params[:page]).per(5)
			@usersPrivilege = User.search2(params[:search]).page(params[:page]).per(5)
			#@usersPrivilege = User.where(:rol=>'super').page(params[:page]).per(5)
		else
			redirect_to root_path
		end
	end
	def change
		if current_user != nil && current_user.rol == "admin"
			@user = User.find(params[:id])
			if @user.rol == 'user'
				@user.rol = 'super'
			else
				@user.rol = 'user'
			end
			@user.save
			@users = User.where(:rol=>'user').page(params[:page]).per(5)
			@usersPrivilege = User.where(:rol=>'super').page(params[:page]).per(5)
			render action: "index"
		else
			redirect_to root_path
		end	
	end
end

