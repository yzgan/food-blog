class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  validates :name, presence: true

  has_one_attached :file
end
