import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="home"
export default class extends Controller {
  static targets = ["chat"]

  scrollDown() {
    console.log(this.chatTarget.scrollTop);
    this.chatTarget.scrollTo(0, this.chatTarget.scrollHeight);
    console.log(this.chatTarget.scrollTop);
  }
}
