class Dog < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true, if: :user_present?

  private

  def user_present?
    user.present?
  end
end
