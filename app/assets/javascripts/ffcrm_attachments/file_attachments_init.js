var widget_bootstrap = (function($) {
    return function() {

        console.log('widget starting up');
        //Make sure dom is visible
        //decalre again in here
        console.log($);
        $.getScript("/assets/ffcrm_attachments/file_attachments.js", function(data, textStatus, jqxhr) {
            console.log(data); // Data returned
            console.log(textStatus); // Success
            console.log(jqxhr.status); // 200
            console.log("Load was performed.");

            ///load others file upload jquery scripts per http://blueimp.github.io/jQuery-File-Upload/
        });
    }
})(jQuery);

widget_bootstrap();