import consumer from "channels/consumer"

document.addEventListener("turbo:load", () => {
  console.log("title")
  consumer.subscriptions.create("GraderChannel", {
    received(data) {
      console.log(data["stdout"])
      // new Notification(data["title"], { body: data["body"] })
    }
  })
})
