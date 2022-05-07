import consumer from "channels/consumer"

document.addEventListener("turbo:load", () => {
  console.log("title")
  console.log(consumer.subscriptions)
  if (consumer.subscriptions.subscriptions.length === 1) return
  consumer.subscriptions.create("GraderChannel", {
    connected() {
      console.log("Connected")
    },
    disconnected() {
      //
    },
    received(data) {
      console.log(data)
      console.log(data["stdout"])
      // new Notification(data["title"], { body: data["body"] })
    }
  })
})
