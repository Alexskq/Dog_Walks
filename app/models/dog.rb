class Dog < ApplicationRecord
  belongs_to :user
  has_many :dog_walks

  validates :name, presence: true
end
