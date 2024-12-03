class Walk < ApplicationRecord
  has_many :users, through: :user_walks
end
