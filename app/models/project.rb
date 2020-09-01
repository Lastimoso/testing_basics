class Project < ApplicationRecord
  # include Projectable

  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: { in: 3..30, allow_blank: true }
  validates :description, presence: true, length: { in: 10..300, allow_blank: true }
  validates :due_date, presence: true

  scope :due_today, -> { where(due_date: Date.current) }
  scope :over_due, -> { where('due_date < ?', Date.current) }
end
