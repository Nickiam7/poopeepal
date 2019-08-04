// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets
//= require moment
//= require tempusdominus-bootstrap-4.js
//= require activestorage
//= require js-offcanvas.pkgd
//= require feeding.js
//= require diapers.js
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load", function() {
   $(window).scroll(function(){
      if ($(this).scrollTop() > 55) {
         $('.navbar--main-nav').addClass('navbar--main-nav-scroll');
      } else {
         $('.navbar--main-nav').removeClass('navbar--main-nav-scroll');
      }
   });

   setTimeout(function() {
      $('.flash-alert').fadeOut('slow', function() {
         $(this).remove();
      });
   },3500);

   let dob = moment($('#baby_dob').val(), 'YYYY-MM-DD hh:mm a').toDate();
   $('#baby_dob').datetimepicker({
      format: 'dddd, MMMM D, YYYY',
      date: dob
   });

   let startTime = moment($('#feeding_start_time').val(), 'h:mm A').toDate();
   let endTime = moment($('#feeding_end_time').val(), 'h:mm A').toDate();   
   $('#feeding_start_time').datetimepicker({
      format: 'LT',
      date: startTime
   });
   $('#feeding_end_time').datetimepicker({
      format: 'LT',
      date: endTime
   });

   let diaperTime = moment($('#diaper_time').val(), 'h:mm A').toDate();
   $('#diaper_time').datetimepicker({
      format: 'LT',
      date: diaperTime
   });

   let babySubmit     = document.querySelector('#baby-submit')
   let babyName       = document.querySelector('#baby_name')
   let babyNameHelper = document.querySelector('#nameHelpBlock')
   let babydob        = document.querySelector('#baby_dob')
   let babydobIcon    = document.querySelector('.fa-calendar')
   let babydobHelper  = document.querySelector('#dobHelpBlock')

   if(babySubmit) {
      babySubmit.addEventListener('click', (event) => {         
         if(babyName.value === '') {
            event.preventDefault()
            babyName.classList.add('baby-error')
            babyNameHelper.classList.remove('text-muted')
            babyNameHelper.classList.add('text-danger')            
         }
         if(babydob.value === '') {
            event.preventDefault()
            babydob.classList.add('baby-error')
            babydobHelper.classList.remove('text-muted')
            babydobHelper.classList.add('text-danger')
            babydobIcon.classList.add('text-danger')
         }
      })
      babyName.addEventListener('focus', () => {
         if(babyName.classList.contains('baby-error')) {
            babyName.classList.remove('baby-error')
            babyNameHelper.classList.remove('text-danger')
         }
      })
      babydob.addEventListener('focus', () => {
         if(babydob.classList.contains('baby-error')) {
            babydob.classList.remove('baby-error')
            babydobHelper.classList.remove('text-danger')
            babydobIcon.classList.remove('text-danger')
         }
      }) 
   }

   const readURL = (input) => {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img-preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#baby-thumb").change(function() {
        $('#img-preview').removeClass('d-none');
        $('#img-preview').addClass('img-thumbnail');

        $('#img-preview--default').addClass('d-none');
        $('#img-preview--default').removeClass('d-block');
        readURL(this);
    });

   (function($){
      $.fn.appendAround = function(){
         return this.each(function(){

            var $self = $( this ),
                  att = "data-set",
                  $parent = $self.parent(),
                  parent = $parent[ 0 ],
                  attval = $parent.attr( att ),
                  $set = $( "["+ att +"='" + attval + "']" );

            function isHidden( elem ){
               return $(elem).css( "display" ) === "none";
            }

            function appendToVisibleContainer(){
               if( isHidden( parent ) ){
                  var found = 0;
                  $set.each(function(){
                     if( !isHidden( this ) && !found ){
                        $self.appendTo( this );
                        found++;
                        parent = this;
                     }
                  });
               }
            }

            appendToVisibleContainer();

            $(window).bind( "resize", appendToVisibleContainer );

         });
      };
   }( jQuery ));
   $( function(){
      $( document ).trigger( "enhance" );
      $( '#left' ).offcanvas( {
         modifiers: "left,overlay",
         triggerButton: '.js-offcanvas-toggler',
         onInit :  function() {
            $(this).removeClass('is-hidden');            
         }
      } );
      const dataOffcanvas = $('#left').data('offcanvas-component');
      $('.offcanvas-nav').find('.nav-link').on('click touchend', function() {
         dataOffcanvas.close();
         $('.c-offcanvas-bg').remove();
      });
      $( ".js-append-around" ).appendAround();
   });
});
