class PostAttatchment < ActiveRecord::Base

	has_attached_file :image
		validates_attachment_presence :image
		belongs_to :post
end
