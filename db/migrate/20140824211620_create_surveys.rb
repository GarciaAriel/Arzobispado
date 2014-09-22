class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.integer :evento_id
      t.timestamps
    end
  end
end
