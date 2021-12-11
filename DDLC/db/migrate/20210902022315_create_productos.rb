class CreateProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :productos do |t|
      t.integer :codigo
      t.string :nombre
      t.string :referencia
      t.integer :stock
      t.float :precio
      t.integer :tipo_id

      t.timestamps
    end
  end
end
