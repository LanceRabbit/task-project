class Task < ApplicationRecord
  validates :title, presence: true

  SORT_OPTIONS = {
    created_at: "created_at desc",
    start_date: "start_date desc",
    end_date: "end_date desc"
  }
  scope :order_created, ->(orded) { order(orded) }
end
