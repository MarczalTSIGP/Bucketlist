class Task < ApplicationRecord
  belongs_to :list

  validates :title, presence: true

  scope :completed, -> { where(done: true) }
  scope :uncompleted, -> { where(done: false) }

  def mark_as_completed
    update_attribute(:done, true)
  end

  def mark_as_uncompleted
    update_attribute(:done, false)
  end
end
