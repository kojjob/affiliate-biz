import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]
  
  connect() {
    console.log("Mobile menu controller connected")
  }
  
  toggle() {
    console.log("Toggle mobile menu")
    if (this.hasMenuTarget) {
      this.menuTarget.classList.toggle("hidden")
    } else {
      console.error("Menu target not found")
    }
  }
}