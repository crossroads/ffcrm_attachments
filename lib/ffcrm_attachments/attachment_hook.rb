module FfcrmAttachments

  class AttachmentHook < FatFreeCRM::Callback::Base

    insert_after :entity_form do |view, context|
      f = context[:f]
      entity = context[:entity]
      view.render(partial: "attachments/attachments_new", locals: {entity: entity , f: f})
    end

    insert_after :entity_update do |view, context|
      entity = context[:entity]
      view.render(partial: "attachments/attachments_update", locals: { entity: entity })
    end

    insert_after :show_contact_bottom do |view, context|
      entity = context[:entity]
      view.render(partial: "attachments/attachments", locals: { entity: entity })
    end

    insert_after :show_campaign_bottom do |view, context|
      entity = context[:entity]
      view.render(partial: "attachments/attachments", locals: { entity: entity })
    end

    insert_after :show_account_bottom do |view, context|
      entity = context[:entity]
      view.render(partial: "attachments/attachments", locals: { entity: entity })
    end

    insert_after :show_lead_bottom do |view, context|
      entity = context[:entity]
      view.render(partial: "attachments/attachments", locals: { entity: entity })
    end

    insert_after :show_opportunity_bottom do |view, context|
      entity = context[:entity]
      view.render(partial: "attachments/attachments", locals: { entity: entity })
    end

    #TODO
    #insert_after :sidebar_files_section do |view, resource|
    #  view.render(partial: "attachments/sidebar_attachments", locals: { entity: resource })
    #end

  end

end
