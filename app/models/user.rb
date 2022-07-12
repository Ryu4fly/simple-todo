class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :username, uniqueness: true, presence: true, length: { in: 5..20 }
  validates :email, uniqueness: true, presence: true, email: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  enum role: {
    'User' => 0,
    'Admin' => 1
  }
end
