class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_one :dog, dependent: :destroy
  accepts_nested_attributes_for :dog, allow_destroy: true, reject_if: :all_blank

  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :user_walks, dependent: :destroy
  has_many :walks, through: :user_walks

  def admin?
    admin
  end
end
