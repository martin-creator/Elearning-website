// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "@hotwired/turbo-rails"
import "controllers"
import "../stylesheets/application"
//= require materialize
//= require rails-ujs
//= require jquery
//= require toastr
//= require materialize-sprockets
//= require turbolinks
//= require_tree .
//= require toastr

 $(document).ready(function(){
  $('.modal').modal();
  $('.sidenav').sidenav();
  $('.dropdown-trigger').dropdown();
});

global.toastr = require("toastr")

