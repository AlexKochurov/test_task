class Tag < ApplicationRecord
  has_and_belongs_to_many :posts

  validates :text, presence: true
  validates :text, uniqueness: { case_sensitive: false }

  def to_s
    "##{text}"
  end
end
