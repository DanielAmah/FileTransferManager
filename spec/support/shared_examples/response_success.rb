RSpec.shared_examples "response success" do |method, template|
  let!(:upload_file) {create(:file_upload, :small_file) }

  context "when route exist successful" do
    it "responds with status 200" do
      expect(response.status).to eq 200
    end
  end
end
