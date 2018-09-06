require 'rails_helper'

RSpec.describe FileUploadsController, :type => :controller do
  let!(:upload_file) {create(:file_upload, :small_file) }

  describe '#create' do
    it 'should create a file successfully' do
      file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'file', 'file.png'), 'image/png')
      post :create, params: { file_upload: { name: 'My first upload', files: file } }
      expect(response.status).to eq 200
    end
  end

  describe '#update' do
    let!(:upload_file) {create(:file_upload, :small_file) }
    it_behaves_like("response success", "get", :edit)
  end

  describe 'DELETE #destroy' do
    context "success" do
      it "deletes the file" do
        expect{
          delete :destroy, params: { id: upload_file.id }
      }.to change(FileUpload, :count).by(-1)
      end
    end
  end
end
