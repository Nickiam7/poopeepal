class Baby < ApplicationRecord
   extend FriendlyId
   friendly_id :name, use: :slugged

   belongs_to :account

   validates :name, :dob, presence: true
end
