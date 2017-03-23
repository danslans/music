/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*JavasScript Que controla el menu (los puntos)*/
$(document).ready(function () {
    dimensiones();
    var state=false;
    var stateMenu=false;
    var menuMobile=$("#menuMobile");
   $("#more").click(function () {
       if(state){
        $("#subMenu").fadeOut("slow");   
        state=false;
       }else{
        $("#subMenu").fadeIn("slow");      
        state=true;
       }
        
    }); 
   menuMobile.click(function () {
       if(stateMenu){
        $("#ContentMenuMobile").fadeOut("slow");   
        stateMenu=false;
       }else{
        $("#ContentMenuMobile").fadeIn("slow");      
        stateMenu=true;
       } 
    }); 
    
    
});
function dimensiones() {
    var quitar="display:none;";
    var poner ="display:inline;";
    
    if(window.innerWidth>1000){
        document.getElementById("title").style=poner;
        document.getElementById("menuMobile").style=quitar;
        //alert(window.innerWidth);
    }else if(window.innerWidth>600 && window.innerWidth<999){
        document.getElementById("title").style=quitar;
        document.getElementById("ul").style=quitar;
        //alert(window.innerWidth);
    }else if(window.innerWidth>200 && window.innerWidth<599){
        document.getElementById("title").style=quitar;
        document.getElementById("ul").style=quitar;
        //alert(window.innerWidth);
    }
}
function activeCheck(idcheck){
    
document.getElementById(idcheck).className="IcCheckActive";
}

