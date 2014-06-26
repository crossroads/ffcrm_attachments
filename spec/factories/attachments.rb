include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :attachment do
    attachment { fixture_file_upload(
      Rails.root.join('files/image.jpg'), 'image/jpg') }
    association :entity, factory: :contact
  end

  factory :doc_attachment, class: Attachment do
    attachment { fixture_file_upload(
      Rails.root.join('files/note.doc'), 'application/msword') }
    association :entity, factory: :contact
  end

end
