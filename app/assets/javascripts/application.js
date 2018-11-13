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
});
