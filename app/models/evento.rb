class Evento < ActiveRecord::Base
	has_many :posts
	has_many :surveys
end
