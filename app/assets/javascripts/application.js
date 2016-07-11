// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-typeahead-rails
//= require handlebars
//= require_tree .

// $(document).ready(function(){
//   $('#query').mouseenter(function(){
//     console.log("enter");
//     $(this).css("border", "1px solid white");
//   });
//   $('#query').mouseleave(function(){
//     console.log("leave");
//     $(this).css("border","");
//   });
// });

$('document').ready(function() {
  setTimeout(function() {
    $('#flash').fadeOut().slideUp();
  }, 3000);
});
