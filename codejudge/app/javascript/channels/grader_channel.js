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
      const test_case_card = document.getElementById(`test_case_${data["id"]}`)
      test_case_card.querySelector(".test-case-card__status").firstChild.textContent = data["passed"] ? "Passed" : "Failed"
    }
  })
})
