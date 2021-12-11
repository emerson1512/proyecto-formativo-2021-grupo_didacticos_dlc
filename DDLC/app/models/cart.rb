class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_producto(producto_id)
      current_item = line_items.find_by_producto_id(producto_id)
      if current_item
        current_item.quantity += 1
      else
        current_item = line_items.build(producto_id: producto_id)
      end
      current_item
  end 

  def total_precio
    line_items.to_a.sum{|item| item.total_precio }
  end
    
end
