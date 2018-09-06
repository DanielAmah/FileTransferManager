FactoryBot.define do
  factory :file_upload do
    name 'My file'

    trait :big_file do
      after(:build) do |fileupload|
        fileupload.files.attach(io: File.open(Rails.root.join('spec', 'factories', 'files', 'kadunga.zip')), filename: 'kadunga.zip', content_type: 'attachment/zip')
      end
    end

    trait :small_file do
      after(:build) do |fileupload|
        fileupload.files.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'file', 'file.png')), filename: 'file.png', content_type: 'image/png')
      end
    end

    trait :similar_files do
      after(:build) do |fileupload|
        fileupload.files.attach(io: File.open(Rails.root.join('spec', 'factories', 'files', 'file.png')), filename: 'file.png', content_type: 'image/png')
        fileupload.files.attach(io: File.open(Rails.root.join('spec', 'factories', 'files', 'file.png')), filename: 'file.png', content_type: 'image/png')
      end
    end
  end
end
