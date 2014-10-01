class AnswerUsersController < ApplicationController
  
  def nuevo
    @submenu=1
    @cuestionario = Survey.find(params[:id])
  end
  
  def crear 
    @submenu=1
    @respuestas = params[:resp]
    @cuestionario_id = params[:id_cuestionario]
    @usuario_id = params[:id_usuario]
    @preguntas_id = params[:id_pregunta]
    #@pregunta_tipo = params[:tipo_pregunta]
    cont = 0

    if(AnswerUser.ya_respondio_cuestionario(current_user.id,@cuestionario_id))
      @respuestas.each { |key,respuesta_usuario|  
        respuesta_usuario.each { |valor|
          @respuestaUsuario = AnswerUser.new(:response => valor, :survey_id => @cuestionario_id , 
            :usuario_id => @usuario_id, :question_id => key.to_s)

          res = Answer.where(question_id: key)
          res.each do |reee|
            puts "pppppppppppppppppppppppppppppppppppppp"
            puts "pppppppppppppppppppppppppppppppppppppp"
            puts valor
            puts reee.content
            puts reee.correct
            if key.to_s==reee.question_id.to_s && valor==reee.content && reee.correct == true
              @respuestaUsuario.response = true
              break
            else
              @respuestaUsuario.response = false
            end
          end 
          @respuestaUsuario.save
          #agregar_archivos_adjuntos(@respuestaUsuario.id, key) 
        }
      }
    end

  end
end
