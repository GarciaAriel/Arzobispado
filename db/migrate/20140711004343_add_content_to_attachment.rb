class AddContentToAttachment < ActiveRecord::Migration
  def change
  	add_column :post_attatchments, :content , :string
  end
end
