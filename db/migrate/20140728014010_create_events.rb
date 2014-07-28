class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :date_start
      t.date :date_end

      t.timestamps
    end
  end
end
