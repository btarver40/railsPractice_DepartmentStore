class Item < ApplicationRecord
  belongs_to :department
  has_many :comments
  validates :name, :body, presence: true
end
