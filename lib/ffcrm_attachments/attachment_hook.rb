class AttachmentHook < FatFreeCRM::Callback::Base

  insert_before :add_file_section do |view, context|
    object = view.instance_variable_get(:@contact)
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
