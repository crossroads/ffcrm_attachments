(function($) {
    console.log('file attachments module!');
    // http://stackoverflow.com/questions/2777030/loading-js-files-and-other-dependent-js-files-asynchronously

    //Problem is there is dependency among the scripts needed in the jquery file plugin.
    // here is a dirty way to use jquery to load requirejs and setup from here, as no plan to apply requirejs across the projects

    $.getScript("//cdnjs.cloudflare.com/ajax/libs/require.js/2.1.9/require.min.js")
        .done(function(data, textStatus, jqxhr) {
            console.log(data); // Data returned
            console.log(textStatus); // Success
            console.log(jqxhr.status); // 200
            console.log("Load was performed.");

            require.config({
                baseUrl: "/assets",
                paths: {
                    "jquery": "jquery",
                    "jquery.ui.widget": "ffcrm_attachments/vendor/jquery.ui.widget"
                },
            });

            ///load others file upload jquery scripts per http://blueimp.github.io/jQuery-File-Upload/

            // //jquery shim remote path
            require(["ffcrm_attachments/jquery.fileupload"], function(fileupload) {
                //     //return an object to define the "my/shirt" module.
                console.log('fileupload loaded');
                //     console.log(fileupload);
            });
        })
        .fail(function(jqxhr, settings, exception) {
            console.log(arguments);
        });
})($);