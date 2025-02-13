import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {
    this.subscription = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        connected: () => console.log(`Connected to the chatroom with the id ${this.chatroomIdValue}.`),
        disconnected: () => console.log(`Disconnected from the chatroom with the id ${this.chatroomIdValue}.`),
        received: data => {
          console.log("Received data:", data);  // Log received data
          this.#insertMessageAndScrollDown(data);
        }
      }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.subscription.unsubscribe()
  }

  resetForm(event) {
    event.target.reset()
  }

  #insertMessageAndScrollDown(data) {
    console.log("Inserting message and scrolling down");  // Log message insertion
    const messageHTML = this.#buildMessageElement(this.currentUserIdValue === data.sender_id, data.message);
    this.messagesTarget.insertAdjacentHTML("beforeend", messageHTML);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
    console.log("Scroll Height after insert:", this.messagesTarget.scrollHeight);
  }

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
        <div class="${this.#userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }
}
