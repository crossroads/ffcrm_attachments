class AttachmentsController < ApplicationController


  #----------------------------------------------------------------------------
  def create

  	#debugger

  	@attachment = Attachment.new()
  	@attachment.attachment = params['fileupload']
  	@attachment.entity_type = params['entity_type']
  	@attachment.entity_id = params['id']
  	@attachment.save

    render(json: to_fileupload(@attachment))
  end

  def show

  	@attachment = Attachment.find(params[:id])
  	send_file attachment.attachment_file_name, :type=>attachment.attachment_content_type, :disposition => 'inline'

  end

  protected

  def to_fileupload(attachment)
  	{
	    files: [
	      {
	        id:   attachment.entity_id,
	        name: attachment.attachment_file_name,
	        type: attachment.attachment_content_type,
	        size: attachment.attachment_file_size,
	        #url:  (url_for :controller=> 'attachments', :id => attachment.id)
	        url:  "/attachments/#{attachment.id}"
	      }
	    ]
	}
  end

 end
