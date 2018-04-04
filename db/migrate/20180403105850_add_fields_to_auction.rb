class AddFieldsToAuction < ActiveRecord::Migration[5.1]
  def change
    add_column :auctions, :seller_id, :integer
    add_column :auctions, :buyer_id, :integer
  end
end
