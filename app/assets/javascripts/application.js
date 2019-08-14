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
//= require jquery
//= require bootstrap-datepicker
//= require turbolinks
//= require_tree .

function scrumTaskHover(task_id) {
  task = document.getElementById(task_id);
  task.innerHTML = "HELLO WORLD!";
}

function scrumTaskReset(task_id) {
  
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (!$(event.target).closest('#modal-window').length)  {
  	document.getElementById('modal-window').style.display = "none";
    $("div:not(.modal)").removeClass("blur");
  }
}

// When the user clicks the X in the top left corner, close the modal
function modalXClose() {
	document.getElementById('modal-window').style.display = 'none';
	$("div:not(.modal)").removeClass("blur");
}