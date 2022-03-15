class Track < ApplicationRecord 
  validates :title, :order, :is_bonus, :album_id, presence: true

  
end