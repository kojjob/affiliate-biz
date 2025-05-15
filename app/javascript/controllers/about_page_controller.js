import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["valueCard", "teamMember", "stats", "statValue"]
  
  connect() {
    console.log("About page controller connected")
    this.animateOnScroll()
    this.animateStats()
    
    // Add scroll event listener for animations
    window.addEventListener('scroll', this.animateOnScroll.bind(this))
  }
  
  disconnect() {
    window.removeEventListener('scroll', this.animateOnScroll.bind(this))
  }
  
  scrollToSection(event) {
    event.preventDefault()
    const sectionId = event.currentTarget.dataset.section
    const section = document.getElementById(sectionId)
    
    if (section) {
      section.scrollIntoView({ behavior: 'smooth' })
    }
  }
  
  animateOnScroll() {
    // Animate value cards when they come into view
    if (this.hasValueCardTarget) {
      this.valueCardTargets.forEach((card, index) => {
        if (this.isInViewport(card)) {
          setTimeout(() => {
            card.classList.add('animate-fade-in')
          }, index * 200) // Stagger the animations
        }
      })
    }
    
    // Animate team members when they come into view
    if (this.hasTeamMemberTarget) {
      this.teamMemberTargets.forEach((member, index) => {
        if (this.isInViewport(member)) {
          setTimeout(() => {
            member.classList.add('animate-fade-in')
          }, index * 200) // Stagger the animations
        }
      })
    }
  }
  
  animateStats() {
    if (this.hasStatsTarget && this.hasStatValueTarget) {
      // Use Intersection Observer to detect when stats section is visible
      const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            this.countUp()
            observer.unobserve(entry.target)
          }
        })
      }, { threshold: 0.1 })
      
      observer.observe(this.statsTarget)
    }
  }
  
  countUp() {
    this.statValueTargets.forEach(stat => {
      const targetValue = parseInt(stat.dataset.value, 10)
      const duration = 2000 // 2 seconds
      const startTime = performance.now()
      
      const updateCounter = (currentTime) => {
        const elapsedTime = currentTime - startTime
        const progress = Math.min(elapsedTime / duration, 1)
        
        // Use easeOutQuad easing function for smoother animation
        const easedProgress = this.easeOutQuad(progress)
        const currentValue = Math.floor(targetValue * easedProgress)
        
        // Format the number with commas
        stat.textContent = this.formatNumber(currentValue)
        
        if (progress < 1) {
          requestAnimationFrame(updateCounter)
        }
      }
      
      requestAnimationFrame(updateCounter)
    })
  }
  
  easeOutQuad(t) {
    return t * (2 - t)
  }
  
  formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
  }
  
  isInViewport(element) {
    const rect = element.getBoundingClientRect()
    return (
      rect.top <= (window.innerHeight || document.documentElement.clientHeight) &&
      rect.bottom >= 0
    )
  }
}
