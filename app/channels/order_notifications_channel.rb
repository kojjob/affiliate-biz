class OrderNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "order_notifications_channel"
  end

  def unsubscribed
  end
end
