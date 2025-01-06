class UserWalk < ApplicationRecord
  belongs_to :user
  belongs_to :walk

  validates :index_user_walks_on_user_id_and_walk_id,
            uniqueness: {
              scope: :walk_id,
              message: l(local: :fr, message: :already_subscribe)
            }
end
