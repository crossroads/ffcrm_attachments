class AttachmentsController < ApplicationController

  def download
    attach = Attachment.find(params[:id])

    if Setting.storage_at_s3
      data = open attach.attachment.url(:original)
      send_data data.read, type: attach.attachment.content_type, disposition: 'inline'
    else
      send_file attach.attachment.path(:original), disposition: 'attachment'
    end
  end

  def remove
    attach = Attachment.find(params[:id])
    attach.destroy
    render json: { status: true }
  end
end
