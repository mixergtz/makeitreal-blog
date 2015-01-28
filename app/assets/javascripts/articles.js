$(document).ready(function(){

  $("#index_articles").click(function(event) {
    $(".home-links .home-link").removeClass("active");
    $(this).parent().addClass("active");
    $(".articles-preview").load("/ .articles-preview");
  });

  $("#last_articles").click(function(event) {
    $(".home-links .home-link").removeClass("active");
    $(this).parent().addClass("active");
    $(".articles-preview").load("/last_articles .last-articles");
  });

  $("#most_commented").click(function(event) {
    $(".home-links .home-link").removeClass("active");
    $(this).parent().addClass("active");
    $(".articles-preview").load("/most_commented .most-commented");
  });


});