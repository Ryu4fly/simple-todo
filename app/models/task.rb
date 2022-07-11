class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { in: 5..50 }
  validates :due, presence: true

  enum status: {
    'Open' => 0,
    'In Progress' => 1,
    'Completed' => 2
  }
end
