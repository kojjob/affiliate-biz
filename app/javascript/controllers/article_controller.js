import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["imagePreview"]

  previewImage(event) {
    const input = event.target
    const fieldName = input.name.match(/\[(.*?)\]/)[1]
    
    if (input.files && input.files[0]) {
      const reader = new FileReader()
      
      reader.onload = (e) => {
        // Check if there's an existing preview
        let previewContainer = this.element.querySelector(`.preview-${fieldName}`)
        
        if (!previewContainer) {
          // Create new preview container
          previewContainer = document.createElement('div')
          previewContainer.classList.add(`preview-${fieldName}`, 'relative', 'mr-4')
          
          const img = document.createElement('img')
          img.classList.add('object-cover', 'h-24', 'w-24', 'rounded-md')
          img.alt = "Preview"
          
          previewContainer.appendChild(img)
          
          // Add remove button
          const removeBtn = document.createElement('a')
          removeBtn.href = "#"
          removeBtn.classList.add('absolute', '-top-2', '-right-2', 'bg-red-100', 'text-red-600', 'p-1', 'rounded-full', 'hover:bg-red-200', 'js-remove-preview')
          removeBtn.dataset.target = fieldName
          removeBtn.innerHTML = `
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          `
          
          removeBtn.addEventListener('click', (e) => {
            e.preventDefault()
            input.value = ''
            previewContainer.remove()
          })
          
          previewContainer.appendChild(removeBtn)
          
          // Insert preview before the first span in the parent container
          const container = input.closest('.mt-1.flex.items-center')
          const firstSpan = container.querySelector('span')
          container.insertBefore(previewContainer, firstSpan)
        } else {
          // Update existing preview
          const img = previewContainer.querySelector('img')
          img.src = e.target.result
        }
        
        // Update the image source
        const img = previewContainer.querySelector('img')
        img.src = e.target.result
      }
      
      reader.readAsDataURL(input.files[0])
    }
  }
}