import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  trackClick(event) {
    const productId = this.element.dataset.affiliateProductId;
    
    // Record the click asynchronously
    fetch('/clicks', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ product_id: productId }),
      credentials: 'same-origin'
    }).catch(error => console.error('Error tracking click:', error));
    
    // Don't prevent default - let the user follow the affiliate link
  }
}