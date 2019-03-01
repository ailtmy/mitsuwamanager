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
//= require rails-ujs
//= require activestorage
//= require jquery.turbolinks
//= require turbolinks
//= require cocoon
//= require select2
//= require select2_locale_ja
//= require_tree .

$(document).on('turbolinks:load',function() {
  $('.select2').select2({
      language: "ja",
      allowClear :true
    });

  $('form').on('cocoon:after-insert', function(){
    $('.select2').select2({
      language: "ja",
      allowClear :true
    })
  });

  var radio = $('input[type="radio"]:checked').val();
  $('input[type="radio"]').on('click', function(){
      if ($(this).val() == radio) {
          $(this).prop('checked', false);
          radio = false;
      } else {
          radio = $(this).val();
      }
  });

  $('#search-btn').click(function(){
    if ($('#search-btn').text() == "検索非表示"){
      $('#search').addClass('d-none');
      $('#search-btn').text("検索表示");
    } else {
      $('#search').removeClass('d-none');
      $('#search-btn').text("検索非表示");
    }
  });

  var duration = 300;
  var $aside = $('.aside');
  var $asideButton = $aside.find('button').on('click', function(){
      $aside.toggleClass('open');
      if($aside.hasClass('open')){
        $aside.stop(true).animate({
          right: '-70px'
        }, duration);
        $asideButton.find('span').text('close');
      } else {
        $aside.stop(true).animate({
          right: '-250px'
        }, duration);
        $asideButton.find('span').text('open');
      };
    });


});
