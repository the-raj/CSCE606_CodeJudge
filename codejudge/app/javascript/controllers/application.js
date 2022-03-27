import { Application } from "@hotwired/stimulus";

const application = Application.start();

document.body.classList.add("light");

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
