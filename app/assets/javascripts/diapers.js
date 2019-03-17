document.addEventListener("turbolinks:load", function() {
   const pooCheck = document.querySelector('#checkPoo')
   const pooOptions = document.querySelector('#poo')
   if(pooCheck) {
      pooCheck.addEventListener('change', function(el) {
         if(el.target.checked) {
            pooOptions.classList.remove('d-none')
         } else {
            pooOptions.classList.add('d-none')
         }
      })
   }

   $('#diaper_time').on('focusin', function() {
      $('.time-done').removeClass('d-none');      
   });
   $('#diaper_time').on('focusout', function() {
      $('.time-done').addClass('d-none');      
   });

   const textureSelect = document.querySelector('#diaper_texture')
   textureSelect.addEventListener('change', function(el) {
      const selected = el.target.value
      if(selected === 'other') {
         const otherInput = document.createElement('input')
         otherInput.classList.add('form-control')
         otherInput.classList.add('other-texture')
         otherInput.classList.add('mt-2')         
         otherInput.setAttribute('id', 'diaper_texture')
         otherInput.setAttribute('name', 'diaper[texture]')
         otherInput.setAttribute('placeholder', 'Add custom texture')
         otherInput.setAttribute('autofocus', 'true')
         textureSelect.after(otherInput)
      }
   })
   textureSelect.addEventListener('change', function(el) {
      const selected = el.target.value;
      if(selected !== 'other' && document.querySelector('.other-texture') !== null) {
         document.querySelector('.other-texture').remove()
      }
   })
})










