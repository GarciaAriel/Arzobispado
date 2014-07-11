class CreatePostAttatchments < ActiveRecord::Migration
  def change
    create_table :post_attatchments do |t|
    	t.references :post, index: true
    end
    add_attachment :post_attatchments, :image
  end
end
