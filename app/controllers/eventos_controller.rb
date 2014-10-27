class EventosController < ApplicationController

	before_action :set_evento, only: [:show, :edit, :update, :destroy]
	skip_before_filter :verify_authenticity_token

	def myevent
		if (user_signed_in? && (current_user.rol == "admin" || current_user.rol == "super"))
			@submenu=1
		end
		@eventos = Evento.where(:user_id => current_user.id).page(params[:page]).per(5)
		render :index
	end

	def index
		if (user_signed_in? && (current_user.rol == "admin" || current_user.rol == "super"))
			@submenu=1
		end
		@eventos = Evento.all.page(params[:page]).per(5)
		
	end
	
	def new
		if user_signed_in? && (current_user.rol == "admin" || current_user.rol == "super")
			@submenu=1
			@evento = Evento.new
		else
			redirect_to new_user_session_path
		end
	end

	def show
		if user_signed_in? && (current_user.rol == "admin" || current_user.rol == "super")
			@submenu=1
		end
		@evento = Evento.find(params[:id])
	end

	def edit
		if user_signed_in? && (current_user.rol == "admin" || current_user.rol == "super")
			@submenu=1
			@evento = Evento.find(params[:id])
		else
			redirect_to new_user_session_path
		end
	end
	
	def create
		if user_signed_in? && (current_user.rol == "admin" || current_user.rol == "super")
			@submenu=1
		    @evento = Evento.new(evento_params)

		    respond_to do |format|
		    @evento.user_id = current_user.id	
		      if @evento.save
		      	 log("Usuario: "+current_user.email+" Creo el evento: "+@evento.nombre+", fecha/hora: "+current_user.last_sign_in_at.to_s+" desde: "+current_user.last_sign_in_ip)
 
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
  		if user_signed_in? && (current_user.rol == "admin" || current_user.rol == "super")
	  		@submenu=1
	  		respond_to do |format|
	  			@nombre=@evento.nombre
	  			if @evento.update(evento_params)
	  				 log("Usuario: "+current_user.email+" Actualizo el evento: "+@nombre+" a "+@evento.nombre+", fecha/hora: "+current_user.last_sign_in_at.to_s+" desde: "+current_user.last_sign_in_ip)
 
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
  		if user_signed_in? && (current_user.rol == "admin" || current_user.rol == "super")
			@submenu=1
		end
	     log("Usuario: "+current_user.email+" elimino el evento: "+@evento.nombre+", fecha/hora: "+current_user.last_sign_in_at.to_s+" desde: "+current_user.last_sign_in_ip)
 
	    @evento.destroy

	    respond_to do |format|
	      format.html { redirect_to eventos_url, notice: 'High score was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	  end
  	
  	private

  def log(event)
    @l=Log.new
    @l.description=event
    @l.user_id=current_user.id
    @l.save
  end    
  	def set_evento
      @evento = Evento.find(params[:id])
    end
    
    def evento_params
      params.require(:evento).permit(:nombre, :descripcion, :fecha_inicio,:image, :fecha_fin,:user_id)
    end
end
