class AnswerUser < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user
  belongs_to :question
  belongs_to :answer
  def self.ya_respondio_cuestionario(usuario,cuestionario)
  		AnswerUser.where(:usuario_id => usuario,:survey_id => cuestionario).first.nil?
  end
  has_attached_file :archivo
  validates_attachment_content_type :archivo, :content_type => ["application/pdf", "application/docx", "application/doc","application/vnd.openxmlformats-officedocument.wordprocessingml.document","application/msword" ]
  
end
