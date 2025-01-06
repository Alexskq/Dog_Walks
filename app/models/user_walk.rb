class UserWalk < ApplicationRecord
  belongs_to :user
  belongs_to :walk

  validates :user_id,
            uniqueness: {
              scope: :walk_id,
              message: I18n.t('already_subscribe', locale: :fr)
            }
end
