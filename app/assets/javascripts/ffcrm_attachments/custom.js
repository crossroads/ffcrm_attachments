$('#file_upload').ajaxForm();

$("#submit_with_file").live("click", function(event) {
  $('#file_upload').ajaxSubmit({
      clearForm: true,
      resetForm: true,
      success: function(data) {
      },
      error: function(jqXHR, error, errorThrown) {
        alert(error)
      }
  });
  return false;
});

