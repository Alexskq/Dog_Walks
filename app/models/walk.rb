class Walk < ApplicationRecord
  has_many :dogs, through: :dog_walks
end
