import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="home"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log(this.formTarget);
    this.element.querySelector('.icon-button').addEventListener('click', this.reveal.bind(this));
    this.element.querySelector('.icon-button').addEventListener('touchstart', this.reveal.bind(this));
  }

  reveal(event) {
    event.preventDefault();
    console.log("in the reveal method");
    this.formTarget.classList.toggle("d-none");
  }
}
