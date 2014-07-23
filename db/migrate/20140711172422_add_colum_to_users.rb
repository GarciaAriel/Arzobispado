class AddColumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rol, :string, :default => "user"
    add_column :users, :nombre, :string, :default => ""
    add_column :users, :apellido, :string, :default => ""
  end
end
