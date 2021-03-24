$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable .col-sm-6").filter(function() {
      console.log(value);
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

$(document).ready(function(){
  $("#myInput2").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable .col-sm-6").filter(function() {
      console.log(value);
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
