class Question < ActiveRecord::Base
	has_many :answer_users
	belongs_to :survey
  	has_many :answers, :dependent => :destroy
  	accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end