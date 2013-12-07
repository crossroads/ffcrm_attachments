var widget_bootstrap = function() {

    console.log('widget starting up');
    console.log('jquery ready:' + !! (((($)||{}).fn)||{}).jquery || window.jQuery);
    //Make sure dom is visible

    //for easier test in chrome where $ is overriden
    var $;
    if (window.jQuery) {
        $ = window.jQuery;

    }
    //abs path?
    console.log($);
    $.getScript("/assets/ffcrm_attachments/file_attachments.js", function(data, textStatus, jqxhr) {
        console.log(data); // Data returned
        console.log(textStatus); // Success
        console.log(jqxhr.status); // 200
        console.log("Load was performed.");

        ///load others file upload jquery scripts per http://blueimp.github.io/jQuery-File-Upload/
    });
};

widget_bootstrap();