require 'spec_helper'

describe ContactsController, type: :controller do

  describe 'add attachments' do
    before do
      @user = User.where(username: 'test', email: 'test@gmail.com').first_or_create
      ContactsController.any_instance.stub(:set_context).and_return(1)
      ContactsController.any_instance.stub(:require_user).and_return(1)
      ContactsController.any_instance.stub(:current_user).and_return(@user)
    end

    it 'should add attachment with contact' do
      contact = FactoryGirl.build :contact
      attachment = FactoryGirl.build :attachment
      contact.attachments << attachment

      Contact.stub(:new).and_return(contact)

      contact_params = { "first_name"=>"test", "last_name"=>"test",
        "attachments_attributes"=> {"0"=> attachment.attributes }}
      account_params = {"id"=> ""}

      xhr :post, :create, contact: contact_params, account: account_params

      Contact.last.should eq(contact)
      contact.attachments.last.should eq(attachment)

      response.status.should eq(200)
    end
  end
end
