class Baby < ApplicationRecord
   extend FriendlyId
   friendly_id :slugs, use: :slugged

   def slugs
      [
         :name,
         self.name + "-" + self.account.last_name
      ]
   end

   has_many :entries, dependent: :destroy
   has_many :feedings, through: :entries

   belongs_to :account
   
   validates :name, :dob, presence: true
end
