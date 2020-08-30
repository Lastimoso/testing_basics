class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: { in: 3..30 }
  validates :description, presence: true, length: { in: 10..300 }
  validates :due_date, presence: true
end
