document.addEventListener("DOMContentLoaded", function () {

    document.addEventListener("click", function () {
        // alert(event.x + "," + event.y  + "test");
        //        saveXY(event.x, event.y)
        ajaxSave(event.x, event.y);
    });

    $(document).on("scroll", function (event) {
        scrollH = document.documentElement.scrollTop;//chrome
        console.log(scrollH);
    });

    // document.addEventListener("scroll", function (event) {
    //     scrollH = document.documentElement.scrollTop;//chrome
    //     console.log(scrollH);
    // });

    function ajaxSave(bsx, bsy) {
        bsy += scrollH;
        console.log("bsy=" + bsy);
        $.post("indexClickEventMonitor.controller", { "bsx": bsx, "bsy": bsy });
        // alert();
    }

});

var scrollH = 0;





