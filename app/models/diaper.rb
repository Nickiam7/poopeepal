class Diaper < ApplicationRecord
  belongs_to :entry, counter_cache: true

  scope :pee_diaper, -> {where(pee: true)}
  scope :poo_diaper, -> {where(poo: true)}
end
