$(document).ready(function() {
  $(".TableHolder tr td, .TableHolder tr:not(:first-child) th").hover(
    function() {
      $(this).addClass("TDActiv");
    },
    function() {
      $(this).removeClass("TDActiv");
    }
  );

  $(".TableHolder tr td").hover(
    function() {
      $(this)
        .parent()
        .find("th")
        .css("background-color", "rgba(0,0,0,0.1)");
    },
    function() {
      $(this)
        .parent()
        .find("th")
        .css("background-color", "inherit");
    }
  );
});
