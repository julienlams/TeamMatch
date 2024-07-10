// app/javascript/controllers/add_sport_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sportModal", "palmaresModal"]

  openSportModal() {
    this.sportModalTarget.classList.add("is-active")
  }

  openPalmaresModal() {
    this.palmaresModalTarget.classList.add("is-active")
  }

  close(event) {
    event.preventDefault()
    this.sportModalTarget.classList.remove("is-active")
    this.palmaresModalTarget.classList.remove("is-active")
  }
}
