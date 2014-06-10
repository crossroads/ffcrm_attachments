require 'spec_helper'

describe AttachmentsController, type: :controller do

  describe 'remove' do
    it 'should delete attachment' do
      contact = FactoryGirl.create :contact
      attachments = FactoryGirl.create_list :attachment, 3, entity: contact
      expect {
        put :remove, id: Attachment.last.id, use_route: :ffcrm_attachments_engine
      }.to change(contact.attachments, :count).by(-1)
      response.status.should eq(200)
    end
  end
end
