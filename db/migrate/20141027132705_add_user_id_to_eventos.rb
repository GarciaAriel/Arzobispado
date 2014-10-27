class AddUserIdToEventos < ActiveRecord::Migration
  def change
  	add_column :eventos, :user_id, :integer
  end
end
