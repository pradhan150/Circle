import consumer from "./consumer"

consumer.subscriptions.create(
    {channel: "GroupChannel"},
   {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the room olasjfdlj!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    debugger
    console.log("Recieving:")
    $(".chat").prepend(data)
  }
});
