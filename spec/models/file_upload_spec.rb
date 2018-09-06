require 'rails_helper'

RSpec.describe FileUpload, :type => :model do

  describe "Validations" do
    subject(:file_upload) { FileUpload.new }
    subject(:upload_file) {create(:file_upload, :one_file) }
    subject(:multiple_file) {create(:file_upload, :similar_files) }
    it "should validate presence of name" do
      file_upload.valid?
      file_upload.name = nil
      expect(file_upload.errors.messages[:name]).to include "can't be blank"
    end

    it "should validate presence of file" do
      file_upload.valid?
      file_upload.files = nil
      expect(file_upload.errors.messages[:base][0]).to eq "File is not attached"
    end

    it "should validate large files" do
      expect{upload_file}.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: File is too large. It has to be below 10MB')
    end

    it "should validate similar files" do
      expect{multiple_file}.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Checksum has already been taken')
    end

  end
end
