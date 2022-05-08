import consumer from "channels/consumer"

document.addEventListener("turbo:load", () => {
  if (consumer.subscriptions.subscriptions.length === 1) return
  consumer.subscriptions.create("GraderChannel", {
    connected() {
      console.log("CONNECTED")
    },
    received(data) {
      const test_case_card = document.getElementById(`test_case_${data["id"]}`).querySelector(".test-case-card")
      test_case_card.classList.remove("test-case-card--failed")
      data["passed"] ? test_case_card.classList.add("test-case-card--success") : test_case_card.classList.add("test-case-card--failed")
      test_case_card.querySelector(".test-case-card__status").querySelector("p").textContent = data["passed"] ? "Passed" : "Failed"
      test_case_card.querySelector(".test-case-card__copy").textContent = `Finished at ${data["finished_at"]}`
    }
  })
})
