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
})