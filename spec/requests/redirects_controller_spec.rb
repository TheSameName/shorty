RSpec.describe "Redirects" do
  describe "GET #show" do
    let(:link) { create(:link) }

    context "when the slug exists" do
      before { get "/#{link.slug}" }

      it "returns a 200 status code" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "when the slug does not exist" do
      before { get "/non-existent-slug" }

      it "returns a 404 status code" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
