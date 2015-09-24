class AttachmentsController < ApplicationController

  def download
    attach = Attachment.find(params[:id])

    if Setting.storage_at_s3
      redirect_to attach.attachment.s3_object.url_for(:read, {
        expires: 10.minutes,
        response_content_disposition: 'attachment'
      }).to_s
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
