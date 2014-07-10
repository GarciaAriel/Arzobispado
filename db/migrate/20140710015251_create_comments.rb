class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.boolean :visible,default: 1
      t.references :post, index: true 
      t.timestamps
    end
  end
end
