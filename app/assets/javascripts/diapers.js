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

   $('#diaperModal').on('hidden.bs.modal', function() {
      $(this).find('#new_diaper')[0].reset();
      pooOptions.classList.add('d-none')
   });
})