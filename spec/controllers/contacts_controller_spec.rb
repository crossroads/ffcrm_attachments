require 'rails_helper'

describe ContactsController, type: :controller do

  describe 'add attachments' do
    before do
      login
    end
    let(:contact) { FactoryBot.create(:contact) }
    let(:file) { fixture_file_upload('spec/files/image.jpg', 'image/jpeg') }

    pending 'should add attachment to a contact' do
      expect(contact.attachments.size).to eq(0)
      contact_params = { "first_name" => "test", "last_name" => "test",
        "attachments_attributes" => {"0" => file } }
      put :update, params: { id: contact.id, contact: contact_params, account: {} }, xhr: true
      expect(contact.attachments.size).to eq(1)
      expect(response.status).to eq(200)
    end
  end
end
