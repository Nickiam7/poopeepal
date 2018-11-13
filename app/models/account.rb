class Account < ApplicationRecord
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

   has_many :babies, dependent: :destroy
end
