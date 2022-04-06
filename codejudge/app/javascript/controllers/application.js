import { Application } from "@hotwired/stimulus";

const application = Application.start();

// TODO: Move the attribute change over to the template as soon as the preferred theme gets saved for a user in the database
document.addEventListener("turbo:load", () => {
  document.body.classList.add("light");
});

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
