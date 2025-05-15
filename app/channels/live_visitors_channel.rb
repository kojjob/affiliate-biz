class LiveVisitorsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "live_visitors_channel"
  end

  def unsubscribed
  end
end
