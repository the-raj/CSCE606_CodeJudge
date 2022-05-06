import consumer from "channels/consumer"

consumer.subscriptions.create("GraderChannel", {
  received(data) {
    console.log(data["title"])
    // new Notification(data["title"], { body: data["body"] })
  }
})

console.log(consumer.subscriptions)