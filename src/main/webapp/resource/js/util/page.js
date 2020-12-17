var flag = true;
$("#top_cb").click(function (){
    var cb = $("input[type = checkbox]");
    for(var i = 0; i < cb.length; i++){
        cb[i].checked = flag;
    }
    flag = !flag;
})