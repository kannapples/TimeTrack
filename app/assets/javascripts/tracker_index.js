ready = function rowColorBanding() {
	var table = document.getElementById("trackers");
	for (var i = 2, row; row = table.rows[i]; i++) { //skip title row and new form row
      var col_val = row.cells[0].innerHTML;
      var parse_val = parseInt(col_val.split(" ",2)[1]) //split the day name and number, then strip the integer from the ordinal
      if (parse_val % 2 == 1){
        $(row).addClass('selected');  //the selected class colors the row green//
      }
    };
 }

 $(document).on('turbolinks:load', ready); //use turbolinks for > rails v5