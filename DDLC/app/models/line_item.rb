class LineItem < ApplicationRecord
    belongs_to :producto
    belongs_to :cart

    def total_precio
        producto.precio * quantity
    end
end
