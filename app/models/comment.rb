class Comment < ApplicationRecord
  belongs_to :item
  before_save :check_author
  validates :body, presence: true

  def check_author
    if self.author.blank?
      self.author = 'Booo, show yourself!'
    end
  end
end
