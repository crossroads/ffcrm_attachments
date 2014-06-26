class AttachmentHook < FatFreeCRM::Callback::Base

  insert_before :add_file_section do |view, context|

    object_name = view.instance_variable_get(:@virtual_path).split("/").first
    object = view.instance_variable_get(("@"+object_name.singularize).to_sym)

    f = context
    view.render(partial: "attachments/attachments_new",
      locals: {entity: object , f: f})
  end

  insert_after :show_files_section do |view, resource|
    view.render(partial: "attachments/attachments",
      locals: { entity: resource })
  end

  insert_after :sidebar_files_section do |view, resource|
    view.render(partial: "attachments/sidebar_attachments",
      locals: { entity: resource })
  end

end
