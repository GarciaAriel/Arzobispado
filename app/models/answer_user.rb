class AnswerUser < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user
  belongs_to :question
  belongs_to :answer
  def self.ya_respondio_cuestionario(usuario,cuestionario)
  		AnswerUser.where(:usuario_id => usuario,:survey_id => cuestionario).first.nil?
  end
end
