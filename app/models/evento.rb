class Evento < ActiveRecord::Base
	has_many :posts
	has_many :surveys

	has_attached_file :image, :styles => { :medium => "350x350>", :thumb => "150x150>" }
		validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
