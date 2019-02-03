document.addEventListener("turbolinks:load", function() {
   $('#feedingModal').on('hidden.bs.modal', function() {
      $(this).find('#new_feeding')[0].reset();
   });
})