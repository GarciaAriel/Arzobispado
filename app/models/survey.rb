class Survey < ActiveRecord::Base
	has_many :questions, :dependent => :destroy
	has_many :answer_users
	accepts_nested_attributes_for :questions, :allow_destroy => true, :reject_if => lambda { |a| a[:content].blank? }
	belongs_to :evento
end
