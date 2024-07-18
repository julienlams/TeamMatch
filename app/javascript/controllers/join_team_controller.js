// app/javascript/controllers/join_team_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]
  static values = { chatroomUrl: String }

  openModal(event) {
    event.preventDefault();
    const teamId = event.target.getAttribute("data-team-id");
    const chatroomUrl = event.target.getAttribute("data-team-chatroom-url");
    this.chatroomUrlValue = chatroomUrl; // Stockez l'URL de la chatroom
    this.modalTarget.classList.add("is-active");
  }

  close(event) {
    event.preventDefault();
    this.modalTarget.classList.remove("is-active");
  }

  goToChatroom(event) {
    event.preventDefault();
    window.location.href = this.chatroomUrlValue;
  }
}
