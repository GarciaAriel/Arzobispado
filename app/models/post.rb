class Post < ActiveRecord::Base

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
		validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
		has_many :comments
		has_many :post_attatchments
		belongs_to :evento
end
