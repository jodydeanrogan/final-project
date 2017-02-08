$(document).on("turbolinks:load", function() {
  var images = ['jumbotron-1.jpg', 'jumbotron-2.jpg', 'jumbotron-3.jpg'];
  $('.jumbotron').css({'background-image': 'url(/assets/jumbotron/' + images[Math.floor(Math.random() * images.length)] + ')'});
});
