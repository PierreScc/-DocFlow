import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static tagets = ["form"]

  connect() {
    console.log(this.formTarget)
  }
  reveal() {
    console.log("in the reveal method");
    this.formTarget.classList.toggle("d-none")
  }
}
