function taskGoalToggle(mode){
// change button toggle class to highlight clicked button
	if (mode == 'today') {
              $("#today-tasks-btn").addClass("active-task-toggle-btn");
              $("#weekly-goals-btn").removeClass("active-task-toggle-btn");
              $("#daily-tasks").removeClass("inactive-task-content-toggle");
              $("#weekly-goals").addClass("inactive-task-content-toggle");
	} else {
	      $("#weekly-goals-btn").addClass("active-task-toggle-btn");
	      $("#today-tasks-btn").removeClass("active-task-toggle-btn");
              $("#daily-tasks").addClass("inactive-task-content-toggle");
              $("#weekly-goals").removeClass("inactive-task-content-toggle");

              $('#weekly-goal-container').find('div').each(function(){
                     var innerDivId = $(this).attr('id');
                     if (typeof(innerDivId) != 'undefined') {
                            var innerDivNum = innerDivId.substring(12, (innerDivId.length));
                            var innerDivMod = innerDivNum % 5;
                            if (innerDivMod == 1) {
                                   $('#'+innerDivId).css('background-color','#5E825F')
                            } else if (innerDivMod ==2) {
                                   $('#'+innerDivId).css('background-color','#AEEBB1')
                            } else if (innerDivMod == 3) {
                                   $('#'+innerDivId).css('background-color','#709E72')
                            } else if (innerDivMod == 4) {
                                   $('#'+innerDivId).css('background-color','#806070')
                            } else {
                                   $('#'+innerDivId).css('background-color','#B0869D')
                            } 
                     }
                     
              });
	}


};
