class Article < ApplicationRecord
  has_rich_text :content
  has_many :images, as: :imageable, dependent: :destroy

  validates :name, :content, presence: true
  validates :name, uniqueness: true

  accepts_nested_attributes_for :images, reject_if: :all_blank,
                                         allow_destroy: true
end
