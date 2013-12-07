class AttachmentHook < FatFreeCRM::Callback::Base

    insert_before :show_contact_bottom do |view, context|
      object = view.instance_variable_get(:@contact)
      f = context[:f]
      view.render(:partial => "attachments/attachments_new", :locals => {:entity => object , :f => f})
    end


    #insert_after :contact_top_section do |view, context|
    #  object = view.instance_variable_get(:@contact)
    #  f = context[:f]
    #  view.render(:partial => "attachments/attachments_new", :locals => {:entity => object , :f => f})
    #end

end