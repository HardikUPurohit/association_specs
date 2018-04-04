class BiddingEngine
  def initialize(auction, amount, bidder)
    @auction = auction
    @bid = Bid.new(bidder: bidder, auction: @auction, amount: amount)
  end

  def bid!
    return @auction.errors.add(:bid, "plz enter valid bid amount") if @bid.amount < 0
    if @bid.valid? && is_bigger?
      @bid.save
    else
      @auction.errors.add(:bid, "must be bigger than the last bid on the auction")
    end
  end

  private

  def is_bigger?
    return true unless @auction.bids.last
    @auction.bids.last.amount < @bid.amount
  end
end
