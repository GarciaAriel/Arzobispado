class Survey < ActiveRecord::Base
	has_many :questions, :dependent => :destroy
	has_many :answer_users
	accepts_nested_attributes_for :questions, :allow_destroy => true, :reject_if => lambda { |a| a[:content].blank? }
	belongs_to :evento
	has_attached_file :docu
	validates_attachment_content_type :docu, :content_type => ["docu/doc", "docu/pdf", ]
end
