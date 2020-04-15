////////////////////////////////////////////////////
////////     PROJECT SELECTORS    /////////////////
////  FUNCTIONALITY FOR LIMITING SELECTION LISTS BASED ON PREVIOUS SELECTION
///////////////////////////////////////////////////


//// WEEKLY GOAL PAGE /////////////////

//// PROJECT UMBRELLA LEVEL SELECTOR //////////////
jQuery(function() {
  return $('select[name="weekly_goal[project_umbrella_id]').change(function() {

    var $sel = $('select[name="weekly_goal[project_id]"'),
    val = $(this).val(),
    project_umbrella = $('option:selected', this).text();

    if (project_umbrella == 'Add New...' ) {
      document.location.href = "/project_umbrellas/new";
    } else {
      $('span > optgroup', $sel).unwrap();
      if (val !== '%') {
        $('optgroup:not([label="' + project_umbrella + '"])', $sel).wrap('<span/>');
      }
    }
  });
});
jQuery(function() {
  return $('select[name="weekly_goal[project_id]').change(function() {

    project = $('option:selected', this).text();

    if (project == 'Add New...' ) {
      document.location.href = "/projects/new";
    } 
  });
});

//// DAILY TASK MODAL ///////////////////

//// PROJECT UMBRELLA LEVEL SELECTOR //////////////
jQuery(function() {
  return $('select[name="daily_task[project_umbrella_id]').change(function() {

    var $sel = $('select[name="daily_task[project_id]"'),
    val = $(this).val(),
    project_umbrella = $('option:selected', this).text();

    if (project_umbrella == 'Add New...' ) {
      document.location.href = "/project_umbrellas/new";
    } else {
      $('span > optgroup', $sel).unwrap();
      if (val !== '%') {
        $('optgroup:not([label="' + project_umbrella + '"])', $sel).wrap('<span/>');
      }
    }
  });
});

//// PROJECT LEVEL SELECTOR //////////////
jQuery(function() {
  return $('select[name="daily_task[project_id]').change(function() {

    var $sel = $('select[name="daily_task[weekly_goal_id]"'),
    val = $(this).val(),
    project = $('option:selected', this).text();

    if (project == 'Add New...' ) {
      document.location.href = "/projects/new";
    } else {
      $('span > optgroup', $sel).unwrap();
      if (val !== '%') {
        $('optgroup:not([label="' + project + '"])', $sel).wrap('<span/>');
      }
    }
  });
});


  //// WEEKLY GOAL LEVEL SELECTOR ////////

jQuery(function() {
  return $('select[name="daily_task[weekly_goal_id]"').change(function() {

    weekly_goal = $('option:selected', this).text();

    if (weekly_goal == 'Add New...' ) {
      document.location.href = "/weekly_goals/new";
    } 
  });
});  

//// TRACKER MODAL ///////////////////


//// PROJECT UMBRELLA LEVEL SELECTOR //////////////
jQuery(function() {
  return $('select[name="tracker[project_umbrella_id]').change(function() {

    var $sel = $('select[name="tracker[project_id]"'),
    val = $(this).val(),
    project_umbrella = $('option:selected', this).text();

    if (project_umbrella == 'Add New...' ) {
      document.location.href = "/project_umbrellas/new";
    } else {
      $('span > optgroup', $sel).unwrap();
      if (val !== '%') {
        $('optgroup:not([label="' + project_umbrella + '"])', $sel).wrap('<span/>');
      }
    }
  });
});

//// PROJECT LEVEL SELECTOR //////////////
jQuery(function() {
  return $('select[name="tracker[project_id]').change(function() {

    var $sel = $('select[name="tracker[weekly_goal_id]"'),
    val = $(this).val(),
    project = $('option:selected', this).text();

    if (project == 'Add New...' ) {
      document.location.href = "/projects/new";
    } else {
      $('span > optgroup', $sel).unwrap();
      if (val !== '%') {
        $('optgroup:not([label="' + project + '"])', $sel).wrap('<span/>');
      }
    }
  });
});


  //// WEEKLY GOAL LEVEL SELECTOR ////////

jQuery(function() {
  return $('select[name="tracker[weekly_goal_id]"').change(function() {

    var $sel = $('select[name="tracker[daily_task_id]"'),
    val = $(this).val(),
    weekly_goal = $('option:selected', this).text();

    if (weekly_goal == 'Add New...' ) {
      document.location.href = "/weekly_goals/new";
    } else {
      $('span > optgroup', $sel).unwrap();
      if (val !== '%') {
        $('optgroup:not([label="' + weekly_goal + '"])', $sel).wrap('<span/>');
      }
    }
  });
}); 

  //// DAILY TASK LEVEL SELECTOR ////////

jQuery(function() {
  return $('select[name="tracker[daily_task_id]"').change(function() {

    daily_task = $('option:selected', this).text();

    if (daily_task == 'Add New...' ) {
      $("#task-goal-modal-window").removeClass("hide"); //make the div visible
      $("#task-goal-modal-window").find(".modal-content").html("<%= j (render '/daily_tasks/new') %>");
      $("div:not(.modal)").addClass("blur");
      var modal_window = document.getElementById('task-goal-modal-window');
      modal_window.classList.remove("blur");
    } 
  });
});  