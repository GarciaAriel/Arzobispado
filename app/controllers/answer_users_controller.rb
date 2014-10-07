class AnswerUsersController < ApplicationController
  
  def nuevo
    @submenu=1
    @cuestionario = Survey.find(params[:id])
  end
  def report
    @submenu=1
    #@survey = Survey.find(params[:id])
    @questions = Question.where(:survey_id=>params[:id])
    @answersUsers = AnswerUser.where(:survey_id=>params[:id])

    render "report"
  end
  
  def crear 
    @submenu=1
    @respuestas = params[:resp]
    @cuestionario_id = params[:id_cuestionario]
    @usuario_id = params[:id_usuario]
    @preguntas_id = params[:id_pregunta]
    @respuestas_id
    #@pregunta_tipo = params[:tipo_pregunta]
    cont = 0

    if(AnswerUser.ya_respondio_cuestionario(current_user.id,@cuestionario_id))
      @respuestas.each { |key,respuesta_usuario|  #question id
        respuesta_usuario.each { |valor|
          @respuestaUsuario = AnswerUser.new(:response => valor, :survey_id => @cuestionario_id , 
            :usuario_id => @usuario_id, :question_id => key.to_s )

          allrespuestas = Answer.where(question_id: key)
          allrespuestas.each do |resp|
            if key.to_s==resp.question_id.to_s && valor==resp.content #&& resp.correct == true
              @respuestaUsuario.answer_id = resp.id
              #@respuestaUsuario.response = true
              break
            # else
            #   @respuestaUsuario.response = false
            end
          end 
          @respuestaUsuario.save
          #agregar_archivos_adjuntos(@respuestaUsuario.id, key) 
        }
      }
    end

  end
end
