class Auction < ApplicationRecord
  has_one :buyer, class_name: "User"
  has_one :seller, class_name: "User"
  has_many :bids

  validates_presence_of :title, :start_date, :end_date, :description, :seller_id
  validates :description, length: { minimum: 10 }
  validates :start_date, date: { after_or_equal_to: Proc.new { Date.today }, message: "must be at least #{(Date.today + 1).to_s}" }

  validate :end_date_is_after_start_date

  private

  def end_date_is_after_start_date
    return if self.start_date.blank? || self.end_date.blank?
    errors.add(:start_date, 'must be earlier than end date') if self.start_date > self.end_date
  end
end
