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
//= require jquery_ujs
//= require turbolinks
//= bootstrap-sprockets
//= require_tree .


$(function() {
  setInterval(function() {
    $.ajax({
      url: '/products.json',
      type: 'GET',
      success: function(data) {
        $.each(data, function(id, value) {
          item = data[id];
          $('.item-'+item.id).find('.bid-price').text(item.current_bid);
          $('.item-'+item.id).find('.bidder').text(item.users_id);
          console.log(value);
        });
      }
    });
  }, 500);
});
