import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "icon"]
  
  connect() {
    // Initialize the accordion
    this.isOpen = false
  }
  
  toggle() {
    this.isOpen = !this.isOpen
    
    if (this.hasContentTarget) {
      if (this.isOpen) {
        this.contentTarget.classList.remove('hidden')
        this.contentTarget.classList.add('block')
      } else {
        this.contentTarget.classList.remove('block')
        this.contentTarget.classList.add('hidden')
      }
    }
    
    if (this.hasIconTarget) {
      if (this.isOpen) {
        // Change the plus icon to minus
        this.iconTarget.innerHTML = `
          <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M18 12H6" />
          </svg>
        `
      } else {
        // Change the minus icon back to plus
        this.iconTarget.innerHTML = `
          <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v12m6-6H6" />
          </svg>
        `
      }
    }
    
    // Update the aria-expanded attribute for accessibility
    this.element.setAttribute('aria-expanded', this.isOpen)
  }
}
