/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    var state=false;
   $("#more").click(function () {
       if(state){
        $("#subMenu").fadeOut("slow");   
        state=false;
       }else{
        $("#subMenu").fadeIn("slow");      
        state=true;
       }
        
    }); 
});

