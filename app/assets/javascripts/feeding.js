document.addEventListener("turbolinks:load", function() {
   $('#feedingModal').on('hidden.bs.modal', function() {
      $('.collapse').removeClass('show');
      $(this).find('#new_feeding')[0].reset();
   });

   $('#feeding_start_time').on('change', function() {
      if($('.done').hasClass('d-none')) {
         $('.done').removeClass('d-none');
      } else {
         $('.done').addClass('d-none');
      }
   });
})