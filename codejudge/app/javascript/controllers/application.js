import { Application } from "@hotwired/stimulus";

const application = Application.start();

// TODO: Move the attribute change over to the template as soon as the preferred theme gets saved for a user in the database
document.addEventListener("turbo:load", () => {
  const body = document.body
  body.classList.add("light")
  const layoutButton = document.getElementById("color-mode-button")
  layoutButton.addEventListener("click", () => {
    if (body.classList.contains("light")) {
      body.classList.remove("light")
      body.classList.add("dark")
    } else {
      body.classList.remove("dark")
      body.classList.add("light")
    }
  })
});

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
