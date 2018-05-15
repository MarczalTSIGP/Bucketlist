class List < ApplicationRecord
  belongs_to :user
  has_many :tasks

  has_many :users_lists
  has_many :shared_users, through: :users_lists, source: :user

  validates :name, presence: true
  validates :name, uniqueness: true
end
