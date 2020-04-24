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

//= require_tree .


// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (!$(event.target).closest('#daily-task-modal-window').length)  {
  	$("#daily-task-modal-window").display = "none";
  }
}

function delete_pu_children(project_umbrella_id, assoc_projects, assoc_wgs_list) {
	var retVal = confirm('Deleting this Project Umbrella will also delete the following Projects: ' + assoc_projects + "and Weekly Goals: " + assoc_wgs_list + "\n\nWould you like to continue?");
	if( retVal == true ) {
    $.ajax({
  		url: "/delete_project_umbrella_and_projects",
  		type: "post",
  		data: { project_umbrella_id: project_umbrella_id, authenticity_token: $('[name="csrf-token"]')[0].content} //NEED VALID AUTHENTICITY TOKEN
		})
    } else {
        return false;
    }
}

function delete_p_children(project_id, assoc_wgs) {
  var retVal = confirm('Deleting this Project will also delete the following Weekly Goals: ' + assoc_wgs + "\n\nWould you like to continue?");
  if( retVal == true ) {
    $.ajax({
      url: "/delete_project_and_wgs",
      type: "post",
      data: { project_id: project_id, authenticity_token: $('[name="csrf-token"]')[0].content} //NEED VALID AUTHENTICITY TOKEN
    })
    } else {
        return false;
    }
}

function hideCompletedTaskGoals(mode) {
  if (mode == 'task') {
    var div_obj = $('#today-completed-tasks-container');
  } else {
    var div_obj = $('#completed-goals-container');
  }

  if (div_obj.hasClass('inactive-task-content-toggle')) {
    div_obj.removeClass('inactive-task-content-toggle');
    $('#'+mode+'-eye-icon').replaceWith('<i id="'+mode+'-eye-icon" class="fas fa-eye-slash action-btn-item"></i>');
  } else {
    div_obj.addClass('inactive-task-content-toggle');
    $('#'+mode+'-eye-icon').replaceWith('<i id="'+mode+'-eye-icon" class="fas fa-eye action-btn-item"></i>');
  }
};


//INITIALIZE TOOLTIPS
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})



