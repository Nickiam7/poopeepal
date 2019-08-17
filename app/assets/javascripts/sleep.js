document.addEventListener("turbolinks:load", function() {
   $('#sleepModal').on('hidden.bs.modal', function() {
      $('.collapse').removeClass('show');
   });

   $('#sleep_start_time').on('focusin', function() {
      $('.start-done').removeClass('d-none');      
   });
   $('#sleep_end_time').on('focusin', function() {
      $('.end-done').removeClass('d-none');      
   });
   $('#sleep_start_time').on('focusout', function() {
      $('.start-done').addClass('d-none');      
   });
   $('#sleep_end_time').on('focusout', function() {
      $('.end-done').addClass('d-none');      
   });

   const progress = document.querySelector('#sleep_in_progress');
   const end_time = document.querySelector('#sleep_end_time');

   if(progress) {
      if(progress.checked == true) {
         end_time.disabled = true;
         end_time.value = null;
         end_time.setAttribute('placeholder', 'Disabled...');
      }
      progress.addEventListener('change', e => {
         if(e.target.checked) {
            end_time.disabled = true;
            end_time.value = null;
            end_time.setAttribute('placeholder', 'Disabled...');
         } else {
            end_time.disabled = false;
            end_time.removeAttribute('placeholder');
         }
      });
   }
})