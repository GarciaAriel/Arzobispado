class Survey < ActiveRecord::Base
	has_many :questions, :dependent => :destroy
	has_many :answer_users
	accepts_nested_attributes_for :questions, :allow_destroy => true, :reject_if => lambda { |a| a[:content].blank? }
	belongs_to :evento

	has_attached_file :archivo
	validates_attachment_content_type :archivo, :content_type => ["application/pdf", "application/docx", "application/doc","application/vnd.openxmlformats-officedocument.wordprocessingml.document","application/msword" ]
end
