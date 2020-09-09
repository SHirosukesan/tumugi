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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//document.getElementById('user_images_images').onchange = function(event){
function onclick_preiew_image()
{
  initializeFiles();

  var files = event.target.files;

  for (var i = 0, f; f = files[i]; i++) {
    var reader = new FileReader;
    reader.readAsDataURL(f);

    reader.onload = (function(theFile) {
      return function (e) {
        var div = document.createElement('div');
        div.innerHTML += '<img class="reader_image" src="' + e.target.result + '" />';
        document.getElementById('list').insertBefore(div, null);
      }
    })(f);
  }
};

function initializeFiles() {
  document.getElementById('list').innerHTML = '';
}

$(function(message) {
        let message_content = (<%= @post.content %>)
        var html = `<div class="action">${message_content}</div>`
        $("#jquery").append(html)
    })