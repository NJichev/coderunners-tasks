class AddBidderNameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :bidder_name, :string
    change_column :products, :current_bid, :decimal, :precision => 10, :scale => 2
  end
end
