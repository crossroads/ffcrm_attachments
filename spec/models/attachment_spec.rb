require 'rails_helper'

describe "Attachment" do
  describe 'associations' do
    it { expect(Contact.new.respond_to?('attachments')).to eql(true) }
    it { expect(Account.new.respond_to?('attachments')).to eql(true) }
    it { expect(Opportunity.new.respond_to?('attachments')).to eql(true) }
    it { expect(Campaign.new.respond_to?('attachments')).to eql(true) }
  end
  describe 'validations' do
    subject { FactoryBot.create(:contact) }
    it do
      subject.attachments.attach(
        io: File.open(File.join('.', 'spec', 'files', 'image.jpg')),
        filename: 'image.jpg',
        content_type: 'image/jpeg'
      )
      expect(subject.attachments.size).to eql(1)
      expect(subject).to be_valid
    end
  end
end
