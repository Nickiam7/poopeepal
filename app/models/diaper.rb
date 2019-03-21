class Diaper < ApplicationRecord
  belongs_to :entry

  scope :pee_diaper, -> {where(pee: true)}
  scope :poo_diaper, -> {where(poo: true)}
end
