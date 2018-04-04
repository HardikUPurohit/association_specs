class Bid < ApplicationRecord
  belongs_to :bidder, class_name: "User"
  belongs_to :auction

  validates_presence_of :bidder_id, :auction_id, :amount
  validates :amount, numericality: { greater_than: 0 }
end
