class Producto < ApplicationRecord
  mount_uploader :foto, FotoUploader
  belongs_to :tipo 
  has_many :line_items
  resourcify
end

