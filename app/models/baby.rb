class Baby < ApplicationRecord
   extend FriendlyId
   friendly_id :slugs, use: :slugged

   def slugs
      [
         :name,
         self.name + "-" + self.account.last_name
      ]
   end

   belongs_to :account
   has_many :entries, dependent: :destroy

   validates :name, :dob, presence: true
end
