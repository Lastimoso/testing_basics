class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user, optional: true

  validates :content, presence: true, length: { in: 5..50 }
  validate :validate_fulfilled_by_user

  private

  def validate_fulfilled_by_user
    return if fulfilled_at? && user_id? || fulfilled_at.nil? && user_id.nil?

    errors.add(:base, "Both timestamp and doer are needed if fulfilled")
  end
end
