class Walk < ApplicationRecord
  has_many :user_walks, dependent: :destroy
  has_many :users, through: :user_walks

  validates :number_of_dog, presence: true, numericality: { greater_than: 0 }
end
