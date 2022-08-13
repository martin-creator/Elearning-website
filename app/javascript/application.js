// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "@hotwired/turbo-rails"
import "controllers"
//= require materialize
//= require rails-ujs
//= require jquery
//= require materialize-sprockets
//= require turbolinks
//= require_tree .

 $(document).ready(function(){
  $('.modal').modal();
  $('.sidenav').sidenav();
  $('.dropdown-trigger').dropdown();
});

