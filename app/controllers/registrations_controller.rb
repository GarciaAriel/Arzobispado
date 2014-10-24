class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end

	def edit
		if user_signed_in? 
			@user = User.find(current_user.id)	
		else
			redirect_to root_path
		end
		
	end
	
	def update
		
		if user_signed_in? 
			respond_to do |format|

		      if @user.update(registration_params)
		        format.html { redirect_to eventos_url, notice: 'High score was successfully destroyed.' }
		      else
		        format.html { render :edit }
		        format.json { render json: @post.errors, status: :unprocessable_entity }
		      end
		    end	
		else
			redirect_to root_path
		end

	    
	end
	
	private
    
    def registration_params
      params.require(:user).permit(:name, :lastname,:email,:rol)
    end
end
