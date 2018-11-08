class Baby < ApplicationRecord
  belongs_to :account

  validates :name, :dob, presence: true
end
