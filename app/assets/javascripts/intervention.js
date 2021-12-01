

function selected_customer(){
    document.getElementById('step3').style.visibility = 'hidden';
        document.getElementById('step4').style.visibility = 'hidden';
        document.getElementById('step5').style.visibility = 'hidden';
        document.getElementById('step6').style.visibility = 'hidden';
        document.getElementById('step7').style.visibility = 'hidden';
        document.getElementById('step8').style.visibility = 'hidden';
   
    document.getElementById('step2').style.visibility= 'visible';
        function removeOptions(selectElement) {
        var i, L = selectElement.options.length - 1;
        for(i = L; i >= 0; i--) {
            selectElement.remove(i);
        }
        }


    removeOptions(document.getElementById('selectedBuilding'));
    var select = document.getElementById('customersDropMenu');
    value = select.options[select.selectedIndex].value;
    console.log(value);
    $.ajax({
        type:'GET',
        url:'/getBuildings/' + value,
        success:function(data){
          //I assume you want to do something on controller action execution success?
          console.log(data);
          var x = document.createElement("OPTION");
          x.setAttribute("value","Select");
          var t = document.createTextNode("--- Please Select ---");
          x.appendChild(t);
          document.getElementById("selectedBuilding").appendChild(x);

          $.each(data, function(i, j) {
            // row = "<option value=\"" + j.id + "\">" + j.title + "</option>";
            // $(row).appendTo("select#course");

            var x = document.createElement("OPTION");
            x.setAttribute("value",j.id);
            var t = document.createTextNode(j.admin_name);
            x.appendChild(t);
            document.getElementById("selectedBuilding").appendChild(x);
           });
        }
      });


}

function selected_building(){
    document.getElementById('step4').style.visibility = 'hidden';
    document.getElementById('step5').style.visibility = 'hidden';
    document.getElementById('step6').style.visibility = 'hidden';
    document.getElementById('step7').style.visibility = 'hidden';
    document.getElementById('step8').style.visibility = 'hidden';
    
    document.getElementById('step3').style.visibility= 'visible';
        function removeOptions(selectElement) {
        var i, L = selectElement.options.length - 1;
        for(i = L; i >= 0; i--) {
            selectElement.remove(i);
        }
        }


    removeOptions(document.getElementById('selectedBattery'));

    var select = document.getElementById('selectedBuilding');
    value = select.options[select.selectedIndex].value;
    console.log(value);
    $.ajax({
        type:'GET',
        url:'/getBattery/' + value,
        success:function(data){
          //I assume you want to do something on controller action execution success?
          console.log(data);
          var x = document.createElement("OPTION");
          x.setAttribute("value","Select");
          var t = document.createTextNode("--- Please Select ---");
          x.appendChild(t);
          document.getElementById("selectedBattery").appendChild(x);

          $.each(data, function(i, j) {
            // row = "<option value=\"" + j.id + "\">" + j.title + "</option>";
            // $(row).appendTo("select#course");
            var x = document.createElement("OPTION");
            x.setAttribute("value",j.id);
            var t = document.createTextNode("Battery ID : " + j.id);
            x.appendChild(t);
            document.getElementById("selectedBattery").appendChild(x);
           });
        }
      });


}
function selected_battery(){

    document.getElementById('step5').style.visibility = 'hidden';
    document.getElementById('step6').style.visibility = 'hidden';
    document.getElementById('step7').style.visibility = 'hidden';
    document.getElementById('step8').style.visibility = 'hidden';
   
    document.getElementById('step4').style.visibility= 'visible';
        function removeOptions(selectElement) {
        var i, L = selectElement.options.length - 1;
        for(i = L; i >= 0; i--) {
            selectElement.remove(i);
        }
        }


    removeOptions(document.getElementById('selectedColumn'));

    var select = document.getElementById('selectedBattery');
    value = select.options[select.selectedIndex].value;
    console.log(value);
    $.ajax({
        type:'GET',
        url:'/getColumn/' + value,
        success:function(data){
          //I assume you want to do something on controller action execution success?
          console.log(data);
          var x = document.createElement("OPTION");
          x.setAttribute("value","Select");
          var t = document.createTextNode("--- Please Select ---");
          x.appendChild(t);
          document.getElementById("selectedColumn").appendChild(x);
          var x = document.createElement("OPTION");
          x.setAttribute("value","null");
          var t = document.createTextNode("NONE");
          x.appendChild(t);
          document.getElementById("selectedColumn").appendChild(x);
          $.each(data, function(i, j) {
            // row = "<option value=\"" + j.id + "\">" + j.title + "</option>";
            // $(row).appendTo("select#course");
            var x = document.createElement("OPTION");
            x.setAttribute("value",j.id);
            var t = document.createTextNode("Column ID : " + j.id);
            x.appendChild(t);
            document.getElementById("selectedColumn").appendChild(x);
           });
        }
      });


}
function selected_column(){
    
    document.getElementById('step5').style.visibility= 'visible';
        function removeOptions(selectElement) {
        var i, L = selectElement.options.length - 1;
        for(i = L; i >= 0; i--) {
            selectElement.remove(i);
        }
        }


    removeOptions(document.getElementById('selectedElevator'));

    var select = document.getElementById('selectedColumn');
    value = select.options[select.selectedIndex].value;
    console.log(value);
    $.ajax({
        type:'GET',
        url:'/getElevator/' + value,
        success:function(data){
          //I assume you want to do something on controller action execution success?
          console.log(data);
          var x = document.createElement("OPTION");
          x.setAttribute("value","Select");
          var t = document.createTextNode("--- Please Select ---");
          x.appendChild(t);
          document.getElementById("selectedElevator").appendChild(x);
          var x = document.createElement("OPTION");
          x.setAttribute("value","null");
          var t = document.createTextNode("NONE");
          x.appendChild(t);
          document.getElementById("selectedElevator").appendChild(x);
          
          $.each(data, function(i, j) {
            // row = "<option value=\"" + j.id + "\">" + j.title + "</option>";
            // $(row).appendTo("select#course");
            console.log(j.id)
            var x = document.createElement("OPTION");
            x.setAttribute("value",j.id);
            var t = document.createTextNode("Elevator ID : " + j.id);
            x.appendChild(t);
            document.getElementById("selectedElevator").appendChild(x);
           });
        }
      });


}
function selected_elevator(){
    document.getElementById('step6').style.visibility= 'visible';
    document.getElementById('step7').style.visibility= 'visible';
    document.getElementById('step8').style.visibility= 'visible';
    
        function removeOptions(selectElement) {
        var i, L = selectElement.options.length - 1;
        for(i = L; i >= 0; i--) {
            selectElement.remove(i);
        }
        }


    removeOptions(document.getElementById('employeeList'));

    
    $.ajax({
        type:'GET',
        url:'/getEmployee/' + value,
        success:function(data){
          //I assume you want to do something on controller action execution success?
          console.log(data);
          var x = document.createElement("OPTION");
          x.setAttribute("value","Select");
          var t = document.createTextNode("--- Please Select ---");
          x.appendChild(t);
          document.getElementById("employeeList").appendChild(x);
          var x = document.createElement("OPTION");
          x.setAttribute("value","none");
          var t = document.createTextNode("NONE");
          x.appendChild(t);
          document.getElementById("employeeList").appendChild(x);

          $.each(data, function(i, j) {
            // row = "<option value=\"" + j.id + "\">" + j.title + "</option>";
            // $(row).appendTo("select#course");
            var x = document.createElement("OPTION");
            x.setAttribute("value",j.id);
            var t = document.createTextNode("ID : " + j.id + " - " + j.last_name);
            x.appendChild(t);
            document.getElementById("employeeList").appendChild(x);
           });
        }
      });


}


