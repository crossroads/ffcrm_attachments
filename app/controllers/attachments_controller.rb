class AttachmentsController < ApplicationController

  def download
    attach = Attachment.find(params[:id])
    send_file attach.attachment.path(:original), disposition: 'attachment'
  end

  def remove
    attach = Attachment.find(params[:id])
    attach.destroy
    render json: { status: true }
  end
end
