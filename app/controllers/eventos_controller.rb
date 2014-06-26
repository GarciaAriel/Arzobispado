class EventosController < ApplicationController
	before_action :set_evento, only: [:show, :edit, :update, :destroy]
	def index
		@eventos = Evento.all
	end
	
	def new
		@evento = Evento.new
	end

	def show
		@evento = Evento.find(params[:id])
	end

	def edit
		@evento = Evento.find(params[:id])
	end
	
	def create
	    @evento = Evento.new(evento_params)

	    respond_to do |format|
	      if @evento.save
	        format.html { redirect_to @evento, notice: 'High score was successfully created.' }
	      else
	        format.html { render :new }
	      end
	    end

  	end

  	def destroy
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
