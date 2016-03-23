class Product < ActiveRecord::Base
  belongs_to :user

  def update_bid(bid_params)
    if current_bid * 1.1 <= bid_params[:current_bid].to_d
      self.current_bid = bid_params[:current_bid].to_d
    else
      false
    end
  end
end
