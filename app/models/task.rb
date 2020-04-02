class Task < ApplicationRecord
  scope :order_created, -> { order(created_at: :desc)}
end
