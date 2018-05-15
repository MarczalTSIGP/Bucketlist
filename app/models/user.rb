class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  has_many :users_lists
  has_many :shared_lists, through: :users_lists, source: :list

  validates :name, presence: true

  def self.search(query)
    order(:name).where("name ilike ?", "%#{query}%")
  end
end
