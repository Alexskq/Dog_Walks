class Walk < ApplicationRecord
  has_many :user_walks, dependent: :destroy
  has_many :users, through: :user_walks
  has_many :dogs, through: :users, source: :dogs

  validates :number_of_dog, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 6
  }

  include PgSearch::Model
  pg_search_scope :search_by_walk_name,
                  against: %i[name location date],
                  associated_against: {
                    users: %i[first_name last_name],
                    dogs: [:name]
                  },
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
