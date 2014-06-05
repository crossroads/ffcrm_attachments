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

$("#attach").live('change', function (){
  last_file_input = $("#entity_extra").find('input').last()[0].files

  if(last_file_input.length > 0) {
    var input_length = $("#entity_extra").find('input:file').length
    var attr_name = $("input#attach").attr('name')
    var set_attr_name = attr_name.replace("[0]", "["+input_length+"]")
    var next_attach_input = get_file_input(set_attr_name)
    $(".next_attachment").append(next_attach_input);
  }

  var file_name = this.files[0].name
  $(this).closest(".attach_div").find('.current_file_name').html(file_name)

  var file_size = get_file_size(this.files[0])
  $(this).closest(".attach_div").find(".file_size").html(file_size)
  $(this).closest(".attach_div").find(".remove_link").show();
});

$(".remove_link").live('click', function(){
  current_file_div = $(this).closest(".attach_div");
  current_file_div.find("#attach").val('');
  current_file_div.hide();
  if($(this).closest('table').hasClass('edit_form')) {
    $(current_file_div.next('input')[0]).val('');
  }
  return false;
});

function get_file_size(file) {
  var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
  fSize = file.size;
  i = 0;
  while(fSize > 900){
    fSize /= 1024;
    i++;
  }
  value = (Math.round(fSize*100)/100) + ' ' + fSExt[i]
  return value;
}

function get_file_input(file_attr_name) {
  file_name_div = "<div class='current_file_name'></div>"
  file_size_div = "<div class='file_size'></div>"
  remove_link_div = "<div class='remove_link'><a href='#'>Remove</a></div>"
  file_input_div = "<input id='attach' name='"+file_attr_name+"' type='file'>"
  complete_div = "<div class='attach_div'>" + file_input_div + file_name_div +
    file_size_div + remove_link_div + "</div>"
  return complete_div;
}
