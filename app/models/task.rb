class Task < ApplicationRecord
  validates :title, presence: true

  scope :order_created, -> { order(created_at: :desc)}
end
