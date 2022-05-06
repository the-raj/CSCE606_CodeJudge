import consumer from "channels/consumer"

document.addEventListener("turbo:load", () => {
  console.log("title")
  consumer.subscriptions.create("GraderChannel", {
    received(data) {
      console.log(data["title"])
      // new Notification(data["title"], { body: data["body"] })
    }
  })
})