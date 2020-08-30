class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :first_name, presence: true, length: { in: 3..20 }
  validates :last_name, presence: true, length: { in: 3..20 }

  def full_name
    "#{first_name&.capitalize} #{last_name&.capitalize}".strip
  end
end
