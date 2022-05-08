// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import cocoon from "cocoon-js-vanilla"
import "channels/grader_channel"
import * as Modal from "modal"

window.Modal = Modal

window.toggleNavbar = () => {
  document.querySelector('.navbar').classList.toggle("navbar--show")
}