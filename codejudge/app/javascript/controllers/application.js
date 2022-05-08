import { Application } from "@hotwired/stimulus"
import axios from "axios"

const application = Application.start();

// TODO: Move the attribute change over to the template as soon as the preferred theme gets saved for a user in the database
document.addEventListener("turbo:load", () => {
  const token = document.querySelector('meta[name="csrf-token"]').content
  const body = document.body
  const layoutButton = document.getElementById("color-mode-button")
  layoutButton.addEventListener("click", () => {
    
    if (body.classList.contains("light")) {
      body.classList.remove("light")
      body.classList.add("dark")
      axios.post("/color_mode", {
        color_mode: "dark",
        authenticity_token: token
      })
    } else {
      body.classList.remove("dark")
      body.classList.add("light")
      axios.post("/color_mode", {
        color_mode: "light",
        authenticity_token: token
      })
    }
  })
});

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
