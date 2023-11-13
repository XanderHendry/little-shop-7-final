class Discount < ApplicationRecord
  belongs_to :merchant

  validates :percentage, presence: true
  validates :threshold, presence: true, numericality: { greater_than_or_equal_to: 1}
end