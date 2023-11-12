class Discount < ApplicationRecord
  belongs_to :merchant

  validates :percentage, presence: true
  validates :threshold, presence: true
end