module AttachmentHelper
  def attachment_icon(attachment)
    attachment.is_image? ? attachment.attachment.url(:medium) :
      attachment.to_default_image
  end

  def attachment_preview(attachment)
    capture { image_tag attachment_icon(attachment), class: 'file_icon' }
  end

  def file_name(attachment)
    attachment.attachment_file_name.truncate(20)
  end
end
