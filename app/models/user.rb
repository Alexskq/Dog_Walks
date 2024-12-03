class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :dogs

    has_many :dog_walks, through: :dogs

   validates :first_name, presence: true
   validates :last_name, presence: true
   validates :email, presence: true, uniqueness: true
end
