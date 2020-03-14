//// SCRUM TASK MODAL ///////////////////

//// PROJECT UMBRELLA LEVEL SELECTOR //////////////
jQuery(function() {
  return $('select[name="scrum_task[project_umbrella_id]').change(function() {

    var $sel = $('select[name="scrum_task[project_id]"'),
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
  return $('select[name="scrum_task[project_id]').change(function() {

    var $sel = $('select[name="scrum_task[project_module_id]"'),
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


  //// PROJECT MODULE LEVEL SELECTOR ////////

jQuery(function() {
  return $('select[name="scrum_task[project_module_id]"').change(function() {

    project_module = $('option:selected', this).text();

    if (project_module == 'Add New...' ) {
      document.location.href = "/project_modules/new";
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

    var $sel = $('select[name="tracker[project_module_id]"'),
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


  //// PROJECT MODULE LEVEL SELECTOR ////////

jQuery(function() {
  return $('select[name="tracker[project_module_id]"').change(function() {

    var $sel = $('select[name="tracker[scrum_task_id]"'),
    val = $(this).val(),
    project_module = $('option:selected', this).text();

    if (project_module == 'Add New...' ) {
      document.location.href = "/project_modules/new";
    } else {
      $('span > optgroup', $sel).unwrap();
      if (val !== '%') {
        $('optgroup:not([label="' + project_module + '"])', $sel).wrap('<span/>');
      }
    }
  });
}); 

  //// SCRUM TASK LEVEL SELECTOR ////////

jQuery(function() {
  return $('select[name="tracker[scrum_task_id]"').change(function() {

    scrum_task = $('option:selected', this).text();

    if (scrum_task == 'Add New...' ) {
      $("#scrum-modal-window").removeClass("hide"); //make the div visible
      $("#scrum-modal-window").find(".modal-content").html("<%= j (render '/scrum_tasks/new') %>");
      $("div:not(.modal)").addClass("blur");
      var modal_window = document.getElementById('scrum-modal-window');
      modal_window.classList.remove("blur");
    } 
  });
});  