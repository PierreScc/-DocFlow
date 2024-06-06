import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["form"]

  reveal() {
    this.formTarget.classList.toggle("d-none")
  }
}
