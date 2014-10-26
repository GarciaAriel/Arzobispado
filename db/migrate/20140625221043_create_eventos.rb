class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :nombre
      t.string :descripcion
      t.date :fecha_inicio
      t.date :fecha_fin
      t.column :binary_data, :imagen
      t.timestamps
    end
    add_attachment :eventos, :image
  end
end
