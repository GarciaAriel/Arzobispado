class EventosController < ApplicationController

	before_action :set_evento, only: [:show, :edit, :update, :destroy]
	skip_before_filter :verify_authenticity_token
	def index
		if user_signed_in? && current_user.rol == "admin" 
			@submenu=1
		end
		@eventos = Evento.all
		
	end
	
	def new
		if user_signed_in? && current_user.rol == "admin" 
			@submenu=1
			@evento = Evento.new
		else
			redirect_to new_user_session_path
		end
	end

	def show
		if user_signed_in? && current_user.rol == "admin" 
			@submenu=1
		end
		@evento = Evento.find(params[:id])
	end

	def edit
		if user_signed_in? && current_user.rol == "admin"
			@submenu=1
			@evento = Evento.find(params[:id])
		else
			redirect_to new_user_session_path
		end
	end
	
	def create
		if user_signed_in? && current_user.rol == "admin"
			@submenu=1
		    @evento = Evento.new(evento_params)

		    respond_to do |format|
		      if @evento.save
		        format.html { redirect_to @evento, notice: 'High score was successfully created.' }
		      else
		        format.html { render :new }
		      end
		    end
	    else
			redirect_to new_user_session_path
		end
  	end

  	def update
  		if user_signed_in? && current_user.rol == "admin"
	  		@submenu=1
	  		respond_to do |format|
	  			if @evento.update(evento_params)
	  				format.html{redirect_to @evento, notice: 'evento ok'}
	  			else
	  				format.html {render :edit}	
	  			end
	  		end
	    else
			redirect_to new_user_session_path
		end		
  	end



  	def destroy
  		if user_signed_in? && current_user.rol == "admin" 
			@submenu=1
		end
	    @evento.destroy
	    respond_to do |format|
	      format.html { redirect_to eventos_url, notice: 'High score was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	  end
  	
  	private

  	def set_evento
      @evento = Evento.find(params[:id])
    end
    
    def evento_params
      params.require(:evento).permit(:nombre, :descripcion, :fecha_inicio, :fecha_fin)
    end
end
