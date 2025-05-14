import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["wishlistIcon", "quickView", "notification"]
  static values = {
    productId: String,
    productName: String
  }

  connect() {
    // Initialize any state when controller connects
    this.isInWishlist = localStorage.getItem(`wishlist-${this.productIdValue}`) === 'true'
    this.updateWishlistIcon()
  }

  toggleWishlist(event) {
    event.preventDefault()
    event.stopPropagation()
    
    this.isInWishlist = !this.isInWishlist
    
    // Save wishlist state to localStorage
    localStorage.setItem(`wishlist-${this.productIdValue}`, this.isInWishlist)
    
    // Update icon
    this.updateWishlistIcon()
    
    // Show notification
    this.showNotification(
      this.isInWishlist 
        ? `${this.productNameValue || 'Product'} added to wishlist` 
        : `${this.productNameValue || 'Product'} removed from wishlist`
    )
  }
  
  updateWishlistIcon() {
    if (!this.hasWishlistIconTarget) return
    
    const icon = this.wishlistIconTarget
    
    if (this.isInWishlist) {
      icon.setAttribute('fill', 'currentColor')
      icon.setAttribute('stroke', 'none')
      icon.parentElement.classList.add('text-rose-500')
      icon.parentElement.classList.remove('text-gray-400')
    } else {
      icon.setAttribute('fill', 'none') 
      icon.setAttribute('stroke', 'currentColor')
      icon.parentElement.classList.remove('text-rose-500')
      icon.parentElement.classList.add('text-gray-400')
    }
  }
  
  showQuickView(event) {
    event.preventDefault()
    if (!this.hasQuickViewTarget) return
    
    this.quickViewTarget.classList.remove('opacity-0', 'invisible')
    this.quickViewTarget.classList.add('opacity-100', 'visible')
  }
  
  hideQuickView(event) {
    event.preventDefault()
    if (!this.hasQuickViewTarget) return
    
    this.quickViewTarget.classList.add('opacity-0', 'invisible')
    this.quickViewTarget.classList.remove('opacity-100', 'visible')
  }
  
  showNotification(message) {
    // Create notification if it doesn't exist as a target
    if (!this.hasNotificationTarget) {
      const notification = document.createElement('div')
      notification.className = 'fixed top-4 right-4 bg-green-100 border-l-4 border-green-500 text-green-700 p-4 rounded shadow-md z-50 animate-fade-in'
      notification.innerHTML = `
        <div class="flex">
          <div class="flex-shrink-0">
            <svg class="h-5 w-5 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          </div>
          <div class="ml-3">
            <p class="text-sm">${message}</p>
          </div>
        </div>
      `
      document.body.appendChild(notification)
      
      // Remove notification after 3 seconds
      setTimeout(() => {
        notification.classList.add('animate-fade-out')
        setTimeout(() => {
          notification.remove()
        }, 300)
      }, 3000)
    } else {
      // Update existing notification
      const messageElement = this.notificationTarget.querySelector('p')
      if (messageElement) {
        messageElement.textContent = message
      }
      
      // Show notification
      this.notificationTarget.classList.remove('hidden')
      
      // Hide after 3 seconds
      setTimeout(() => {
        this.notificationTarget.classList.add('animate-fade-out')
        setTimeout(() => {
          this.notificationTarget.classList.add('hidden')
          this.notificationTarget.classList.remove('animate-fade-out')
        }, 300)
      }, 3000)
    }
  }
  
  addToCart(event) {
    event.preventDefault()
    event.stopPropagation()
    
    // Here you would typically make an AJAX request to add the item to cart
    // For now, just show a notification
    this.showNotification(`${this.productNameValue || 'Product'} added to cart`)
  }
  
  quickBuy(event) {
    event.preventDefault()
    event.stopPropagation()
    
    // Here you would typically redirect to checkout or process a quick purchase
    // For demo purposes, just show a notification
    this.showNotification(`Processing quick purchase for ${this.productNameValue || 'this product'}...`)
  }
}