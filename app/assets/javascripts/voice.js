var value;
var radioSelected;
var fee;
var nbApt;
var nbFloor;
var nbElevator;
var nbBase;
var nbOccupants;


// Main Function, Show fields and Hide them
function mainFunction(){

    var select = document.getElementById('action');
    value = select.options[select.selectedIndex].value;

    
    // Residential Fields
    if(value=="register"){
    
    document.getElementById('register').style.visibility= 'visible';
    document.getElementById('status').style.visibility= 'visible';
    document.getElementById('multiSelect').style.visibility= 'hidden';
    checkStatus(0);
    }else if(value=="identify"){
    checkStatus(2);
    // Corporate Fields    
    document.getElementById('multiSelect').style.visibility= 'visible';
    document.getElementById('identify').style.visibility= 'visible';
    document.getElementById('status').style.visibility= 'hidden';
    document.getElementById('register').style.visibility= 'hidden';
    }else if(value=="text_to_speech"){
    // Hybrid Fields
    document.getElementById('multiSelect').style.visibility= 'hidden';
    document.getElementById('register').style.visibility= 'hidden';
    }else if(value=="select"){

    document.getElementById('register').style.visibility= 'hidden';
    document.getElementById('multiSelect').style.visibility= 'hidden';
    }   
    




}
function checkStatus(code){

    if(code == 0){
    function removeOptions(selectElement) {
        var i, L = selectElement.options.length - 1;
        for(i = L; i >= 0; i--) {
            selectElement.remove(i);
        }
        }


    removeOptions(document.getElementById('selected_user'));
    
    $.ajax({
        type:'GET',
        url:'/checkAllStatus',
        success:function(data){
            
            
          console.log(data);
          var x = document.createElement("OPTION");
          x.setAttribute("value","Select");
          var t = document.createTextNode("--- Please Select ---");
          x.appendChild(t);
          document.getElementById("selected_user").appendChild(x);

          $.each(data, function(i, j) {
              


            var x = document.createElement("OPTION");
            x.setAttribute("value",j.userId);
            var t = document.createTextNode(j.username);
            x.appendChild(t);
            document.getElementById("selected_user").appendChild(x);
           });
        }
      });





    }else if(code == 1){
        
        
    var select = document.getElementById('selected_user');
    value = select.options[select.selectedIndex].value;
        
        
        $.ajax({
        type:'GET',
        url:'/checkStatus/' + value,
        success:function(data){
            
            
          console.log(data);
        document.getElementById("statusInput").value = data['enrollmentStatus'];
        }
      });



    }else if(code == 2){
        function removeOptions(selectElement) {
        var i, L = selectElement.options.length - 1;
        for(i = L; i >= 0; i--) {
            selectElement.remove(i);
        }
        }


    removeOptions(document.getElementById('user_to_identify'));
    
    $.ajax({
        type:'GET',
        url:'/checkAllStatus',
        success:function(data){
            
            
          console.log(data);

          $.each(data, function(i, j) {
              


            var x = document.createElement("OPTION");
            x.setAttribute("value",j.userId);
            var t = document.createTextNode(j.username);
            x.appendChild(t);
            document.getElementById("user_to_identify").appendChild(x);
           });
        }
      });

    }


}

function sendIdentification(){

    var selected = [];
    for (var option of document.getElementById('user_to_identify').options)
    {
        if (option.selected) {
            selected.push(option.value);
        }
    }
    console.log(selected);
    
    var upload = document.getElementById("upload2").files[0];
    var fd = new FormData();
    fd.append('upload', upload);
    fd.append("selcted_user",selected);
    console.log(upload);
    $.ajax({
      url: 'identify2',
      data: fd,
      processData: false,
      type: 'POST',
      contentType: false,
      cache: false,
      mimeType: 'multipart/form-data',
      dataType: 'JSON',
      beforeSend: function() {
        document.getElementById("VoiceTextBox").value = "Loading...";
      },
       success:function(data){

            console.log(data);

            $.each(data, function(i, j) {
            
            if(j.length == 0){
                document.getElementById("VoiceTextBox").value = "No Recognised Profile Detected";
            }else{
                document.getElementById("VoiceTextBox").value = "";

            $.each(j,function(p,c){
            
                     document.getElementById("VoiceTextBox").value += "Identified Profile : " + c.username +'\r\n';  
            }); 

            }
            


           });

           console.log(data.length);
            
        },
        error:function(data){
        }
    
       
    });
}
