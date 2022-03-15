class Track < ApplicationRecord 
  validates :title, :order, :is_bonus, :album_id, presence: true

  belongs_to :album,
    foreign_key: :album_id,
    class_name: :Album
end