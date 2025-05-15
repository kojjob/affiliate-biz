// Import all the channels to be used by Action Cable
import "channels/notification_channel"
import "channels/product_updates_channel"
import "channels/live_visitors_channel"
import "channels/order_notifications_channel"

import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    // Called when the subscription is ready for use
  },
  disconnected() {
    // Called when the subscription has been terminated
  },
  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
})

consumer.subscriptions.create("ProductUpdatesChannel", {
  connected() {},
  disconnected() {},
  received(data) {}
})

consumer.subscriptions.create("OrderNotificationsChannel", {
  connected() {},
  disconnected() {},
  received(data) {}
})

consumer.subscriptions.create("LiveVisitorsChannel", {
  connected() {},
  disconnected() {},
  received(data) {}
})
