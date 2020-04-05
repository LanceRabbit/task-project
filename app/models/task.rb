class Task < ApplicationRecord
  include AASM

  belongs_to :user

  validates :title, presence: true

  SORT_OPTIONS = {
    created_at: "created_at desc",
    start_date: "start_date desc",
    end_date: "end_date desc",
    priority_t: "priority desc",
  }
  scope :order_created, ->(orded) { order(orded) }

  enum state: %i[todo doing completed]
  enum priority: %i[low medium high]

  aasm column: :state, enum: true do
    state :todo, initial: true
    state :doing, :completed

    event :execute do
      transitions from: :todo, to: :doing
    end

    event :finish do
      transitions from: %i[todo doing], to: :completed
    end
  end
end
