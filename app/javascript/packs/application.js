// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require jquery_ujs
import 'bootstrap'
require("jquery")
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import '../stylesheets/application'
import jquery from 'jquery';
window.$ = window.jquery = jquery;
Rails.start()
Turbolinks.start()
ActiveStorage.start()



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


