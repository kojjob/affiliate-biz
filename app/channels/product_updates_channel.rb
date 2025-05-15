class ProductUpdatesChannel < ApplicationCable::Channel
  def subscribed
   stream_from "product_updates_channel"
  end

  def unsubscribed
  end
end
