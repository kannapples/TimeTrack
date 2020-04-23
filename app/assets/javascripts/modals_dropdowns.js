// 
// MANIPULATE COLORS FOR DAILY TASKS AND WEEKLY GOALS
function taskGoalToggle(mode){
       
  var cat_array_unique = []

	if (mode == 'week') {
    //Toggle the today/this week button and hide today task content
    $("#weekly-goals-btn").addClass("active-task-toggle-btn");
    $("#today-tasks-btn").removeClass("active-task-toggle-btn");
    $("#trackers-btn").removeClass("active-task-toggle-btn");
    $("#daily-tasks").addClass("inactive-task-content-toggle");
    $("#weekly-goals").removeClass("inactive-task-content-toggle");
    $("#trackers").addClass("inactive-task-content-toggle");

    //collect all daily task project umbrella titles
    var project_umbrella_elems = document.getElementsByClassName('wg-task-pu');
    
    //loop through weekly goals and collect various element information
    for (var i=0; i < project_umbrella_elems.length; i++) {
      //create array of unique project umbrella titles
      var pu_elem = project_umbrella_elems[i];
      var pu_element_name = pu_elem.innerText;
      if (cat_array_unique.indexOf(pu_element_name) == -1) {
            cat_array_unique.push(pu_element_name)
      }

      var wg_elem = project_umbrella_elems[i].parentNode.parentNode.parentNode;   
         
      var button_arr = wg_elem.getElementsByClassName('weekly-goal-btn');
       

      if (button_arr.length > 0){
        //loop through daily tasks within weekly goals
        for (var j = 0; j < button_arr.length; j++) {
          // if (!(button_arr.item(j) === null)) { //exclude nulls
            
            var button_elem = button_arr[j];
            var is_complete = button_elem.classList.contains('weekly-goal-completed');

            var button_parent_elem = button_elem.parentNode
            var button_dropdown_item_arr = button_parent_elem.getElementsByClassName('task-dropdown-item');

            //change hover and background colors
            assignProjectUmbrellaColors(pu_elem, pu_element_name, cat_array_unique, button_elem, is_complete, button_dropdown_item_arr, wg_elem, mode);
          // } 
        }
      }
    }
	} else if (mode == 'today'){
    //Toggle the today/this week button and hide weekly goal content
    $("#today-tasks-btn").addClass("active-task-toggle-btn");
    $("#weekly-goals-btn").removeClass("active-task-toggle-btn");
    $("#trackers-btn").removeClass("active-task-toggle-btn");
    $("#daily-tasks").removeClass("inactive-task-content-toggle");
    $("#weekly-goals").addClass("inactive-task-content-toggle");
    $("#trackers").addClass("inactive-task-content-toggle");

    //collect all daily task project umbrella titles
    var dt_buttons = document.getElementsByClassName('dt-task-pu');
    //loop through daily tasks and collect various element information
    
    for (var i=0; i < dt_buttons.length; i++) {
      //create array of unique project umbrella titles
      var pu_elem = dt_buttons[i];
      var pu_element_name = pu_elem.innerText;

      if (cat_array_unique.indexOf(pu_element_name) == -1) {
      cat_array_unique.push(pu_element_name)
      }
      var button_elem = dt_buttons.item(i).parentNode.parentNode.parentNode

      var is_complete = button_elem.classList.contains('daily-task-completed');
      var button_parent_elem = button_elem.parentNode
      var button_dropdown_item_arr = button_parent_elem.getElementsByClassName('task-dropdown-item');

      //change hover and background colors
      assignProjectUmbrellaColors(pu_elem, pu_element_name, cat_array_unique, button_elem, is_complete, button_dropdown_item_arr, mode);
    }  
	} else if (mode == 'tracker') {
    //Toggle the today/this week button and hide weekly goal content
    $("#today-tasks-btn").removeClass("active-task-toggle-btn");
    $("#weekly-goals-btn").removeClass("active-task-toggle-btn");
    $("#trackers-btn").addClass("active-task-toggle-btn");
    $("#daily-tasks").addClass("inactive-task-content-toggle");
    $("#weekly-goals").addClass("inactive-task-content-toggle");
    $("#trackers").removeClass("inactive-task-content-toggle");
  }
};

// assign colors based on project umbrella name
function assignProjectUmbrellaColors(pu_elem, pu_element_name, cat_array_unique, button_elem, is_complete, button_dropdown_item_arr, wg_elem, mode) {
  // I'M ASSUMING THERE WON'T BE MORE THAN 10 PROJECT UMBRELLAS, CAN FIX THIS WHEN ANGULARJS IS UP AND RUNNING
  var hex = '';

  if (pu_element_name == cat_array_unique[0]) {
    hex = '#DADDF2';
    // hex_light = '#F8FBFF';
    hex_light = '#fff';
    updateBorderColor(pu_elem, button_elem, wg_elem, hex, hex_light, mode);  
    updateButtonHover(button_elem, is_complete, hex);
    updateDropDownHover(button_dropdown_item_arr, hex); 
  } else if (pu_element_name == cat_array_unique[1]) {
    hex = '#F5DCDC';
    // hex_light = '#FFF6F7';
    hex_light = '#fff';
    updateBorderColor(pu_elem, button_elem, wg_elem, hex, hex_light, mode);  
    updateButtonHover(button_elem, is_complete, hex);
    updateDropDownHover(button_dropdown_item_arr, hex); 
  } else if (pu_element_name == cat_array_unique[2]) {
    hex = '#EBE1B7';
    // hex_light = '#FFFCD1';
    hex_light = '#fff';
    updateBorderColor(pu_elem, button_elem, wg_elem, hex, hex_light, mode);  
    updateButtonHover(button_elem, is_complete, hex);
    updateDropDownHover(button_dropdown_item_arr, hex); 
  } else if (pu_element_name == cat_array_unique[3]) {
    hex = '#DCF5F1';
    // hex_light = '#E8FFFE';
    hex_light = '#fff';
    updateBorderColor(pu_elem, button_elem, wg_elem, hex, hex_light, mode);  
    updateButtonHover(button_elem, is_complete, hex);
    updateDropDownHover(button_dropdown_item_arr, hex); 
  } else if (pu_element_name == cat_array_unique[4]) {
    hex = '#E5F5DC';
    // hex_light = '#F0FFE8';
    hex_light = '#fff';
    updateBorderColor(pu_elem, button_elem, wg_elem, hex, hex_light, mode);  
    updateButtonHover(button_elem, is_complete, hex);
    updateDropDownHover(button_dropdown_item_arr, hex); 
  } else if (pu_element_name == cat_array_unique[5]) {
    hex = '#E5F5DC';
    // hex_light = '#F0FFE8';
    hex_light = '#fff';
    updateBorderColor(pu_elem, button_elem, wg_elem, hex, hex_light, mode);  
    updateButtonHover(button_elem, is_complete, hex);
    updateDropDownHover(button_dropdown_item_arr, hex); 
  } else if (pu_element_name == cat_array_unique[6]) {
    hex = '#F5DCDC';
    // hex_light = '#FFF6F7';
    hex_light = '#fff';
    updateBorderColor(pu_elem, button_elem, wg_elem, hex, hex_light, mode);  
    updateButtonHover(button_elem, is_complete, hex);
    updateDropDownHover(button_dropdown_item_arr, hex); 
  } else if (pu_element_name == cat_array_unique[7]) {
    hex = '#EBE1B7';
    // hex_light = '#FFFCD1';
    hex_light = '#fff';
    updateBorderColor(pu_elem, button_elem, wg_elem, hex, hex_light, mode);  
    updateButtonHover(button_elem, is_complete, hex);
    updateDropDownHover(button_dropdown_item_arr, hex); 
  } else if (pu_element_name == cat_array_unique[8]) {
    hex = '#DCF5F1';
    // hex_light = '#E8FFFE';
    hex_light = '#fff';
    updateBorderColor(pu_elem, button_elem, wg_elem, hex, hex_light, mode);  
    updateButtonHover(button_elem, is_complete, hex);
    updateDropDownHover(button_dropdown_item_arr, hex); 
  } else if (pu_element_name == cat_array_unique[9]) {
    hex = '#DADDF2';
    // hex_light = '#F8FBFF';
    hex_light = '#fff';
    updateBorderColor(pu_elem, button_elem, wg_elem, hex, hex_light, mode);  
    updateButtonHover(button_elem, is_complete, hex);
    updateDropDownHover(button_dropdown_item_arr, hex); 
  }
};

// updates the border color of daily task or weekly goal sections
function updateBorderColor(pu_elem, button_elem, wg_elem, hex, hex_light, mode) {  
  pu_elem.style.backgroundColor = hex; 

  if (mode == 'week'){
    wg_elem.style.borderLeftColor = hex;
    wg_elem.style.backgroundColor =  hex_light;
  } else {
    button_elem.style.borderLeftWidth = '0.4em';
    button_elem.style.borderLeftColor = hex;  
    
  }
};

// changes hover color for daily task buttons within weekly goal
function updateButtonHover(button_elem, is_complete, hex) {
  // console.log(button_elem);
  button_elem.addEventListener("mouseover", function(){
    $(this).css("background-color", hex);
  });
  button_elem.addEventListener("mouseout", function(){
    // $(this).css("background-color", "#f8f9fa");
    
    if (is_complete == true){
      $(this).css("background-color", "#E9E9E9");
    } else {
      $(this).css("background-color", "#fff");
    }    
  });      
};

function updateDropDownHover(button_dropdown_item_arr, hex) {
  for (var k=0; k < button_dropdown_item_arr.length; k++){
    var button_dropdown_item_elem = button_dropdown_item_arr.item(k)
    var button_dropdown_div_elem = button_dropdown_item_elem.parentNode;

    //mouseover 
    button_dropdown_div_elem.addEventListener("mouseover", function(){
      $(this).css("background-color", hex);
    });
    button_dropdown_item_elem.addEventListener("mouseover", function(){
      $(this).css("background-color", 'inherit');
    });

    //mouseout
    button_dropdown_div_elem.addEventListener("mouseout", function(){
      $(this).css("background-color", '#fff');
    });
    button_dropdown_item_elem.addEventListener("mouseout", function(){
      $(this).css("background-color", 'inherit');
    });

    //focus in
    button_dropdown_item_elem.addEventListener("focusin", function(){
      $(this).css("background-color", hex);
    });

    //focus out
    button_dropdown_item_elem.addEventListener("focusout", function(){
      $(this).css("background-color", 'inherit');
    });
  }
};

function cascadeWGModal(){
  hideWGModal();
};

function hideWGModal() {
  setTimeout(function(){ //Set small timeout so that submit function happens before ajax call. Otherwise weekly goal object wont exist in database yet.
    //hide weekly goal modal
    var wg_name = $("#weekly_goal_name").val();
   
    $.ajax({
      url: '/new_dt_inherited_task',  
      type: 'post',
      dataType: 'script',
      data: { weekly_goal_name: wg_name, authenticity_token: $('[name="csrf-token"]')[0].content} //NEED VALID AUTHENTICITY TOKEN
    });

    $('#task-goal-modal-window').modal('hide');
    },250) 
};


//CALL INITIALIZATION FUNCTION TO LOAD CUSTOM COLORS
window.onload = function(){
  taskGoalToggle('today');
}


