require 'spec_helper'

describe ContactsController, type: :controller do

  describe 'add attachments' do
    let(:user) { User.where(username: 'test', email: 'test@example.com').first_or_create }
    before do
      login
    end

    pending 'should add attachment with contact' do
      contact = FactoryGirl.build :contact
      attachment = FactoryGirl.build :attachment
      contact.attachments << attachment
      allow(Contact).to receive(:new).and_return(contact)
      contact_params = { "first_name"=>"test", "last_name"=>"test",
        "attachments_attributes"=> {"0"=> attachment.attributes }}
      account_params = {"id"=> ""}
      xhr :post, :create, contact: contact_params, account: account_params
      expect(Contact.last).to eq(contact)
      expect(contact.attachments.last).to eq(attachment)
      expect(response.status).to eq(200)
    end
  end
end
