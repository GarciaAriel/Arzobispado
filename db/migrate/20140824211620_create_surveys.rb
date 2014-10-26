class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.integer :evento_id
      t.timestamps
    end
    add_attachment :surveys, :archivo
  end
end
