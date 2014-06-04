class AttachmentsController < ApplicationController

  def download
    attach = Attachment.find(params[:id])
    send_file attach.attachment.path(:original), disposition: 'attachment'
  end

end
