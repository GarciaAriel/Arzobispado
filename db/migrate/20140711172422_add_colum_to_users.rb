class AddColumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rol, :string, :default => "user"
    
  end
end
