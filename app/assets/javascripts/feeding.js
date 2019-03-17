document.addEventListener("turbolinks:load", function() {
   $('#feedingModal').on('hidden.bs.modal', function() {
      $('.collapse').removeClass('show');
   });

   $('#feeding_start_time').on('focusin', function() {
      $('.start-done').removeClass('d-none');      
   });
   $('#feeding_end_time').on('focusin', function() {
      $('.end-done').removeClass('d-none');      
   });
   $('#feeding_start_time').on('focusout', function() {
      $('.start-done').addClass('d-none');      
   });
   $('#feeding_end_time').on('focusout', function() {
      $('.end-done').addClass('d-none');      
   });
})