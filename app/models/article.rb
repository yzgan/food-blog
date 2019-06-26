class Article < ApplicationRecord
  has_rich_text :content
  has_many_attached :images

  validates :name, :content, presence: true
  validates :name, uniqueness: true
end
