class Baby < ApplicationRecord
   extend FriendlyId
   friendly_id :slugs, use: :slugged

   def slugs
      [
         :name,
         self.name + "-" + self.account.last_name
      ]
   end

   def baby_photo_thumb
      self.baby_thumb.present? ? self.baby_thumb.url : "/assets/baby-default.png"
   end

   has_many :entries, dependent: :destroy
   has_many :feedings, through: :entries
   has_many :diapers, through: :entries
   has_many :sleeps, through: :entries

   belongs_to :account
   
   validates :name, :dob, presence: true
   
   mount_uploader :baby_thumb, BabyUploader
end
