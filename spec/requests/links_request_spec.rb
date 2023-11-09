RSpec.describe "Links" do
  before { sign_in }

  describe "GET index" do
    it "renders a successful response" do
      get links_path

      expect(response).to be_successful
    end
  end

  describe "GET :show" do
    let!(:link) { create(:link) }

    it "renders a successful response" do
      get link_path(link)

      expect(response).to be_successful
    end
  end

  describe "GET :new" do
    it "renders a successful response" do
      get new_link_path

      expect(response).to be_successful
    end
  end

  describe "GET :edit" do
    let!(:link) { create(:link) }

    it "renders a successful response" do
      get edit_link_path(link)
      expect(response).to be_successful
    end
  end

  describe "POST :create" do
    let(:valid_attributes) { attributes_for(:link) }

    context "with valid parameters" do
      it "creates a new Link" do
        expect do
          post links_path, params: { link: valid_attributes }
        end.to change(Link, :count).by(1)
      end

      it "redirects to the created link" do
        post links_path, params: { link: valid_attributes }

        expect(response).to redirect_to(link_path(Link.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Link" do
        expect do
          post links_path, params: { link: valid_attributes.except(:url) }
        end.not_to change(Link, :count)
      end

      it 'renders a successful response (i.e. to display the "new" template)' do
        post links_path, params: { link: valid_attributes.except(:url) }

        expect(response).not_to be_successful
      end
    end
  end

  describe "PATCH :update" do
    let!(:link) { create(:link) }
    let(:new_attributes) { attributes_for(:link) }

    context "with valid parameters" do
      it "updates the requested link" do
        patch link_path(link), params: { link: new_attributes }
        link.reload
        expect(link.url).to eq(new_attributes[:url])
      end

      it "redirects to the link" do
        patch link_path(link), params: { link: new_attributes }
        link.reload
        expect(response).to redirect_to(link_path(link))
      end
    end

    context "with invalid parameters" do
      it 'renders a successful response (i.e. to display the "edit" template)' do
        patch link_path(link), params: { link: new_attributes.except(:url) }

        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE /links/:id" do
    let!(:link) { create(:link) }

    it "destroys the requested link" do
      expect do
        delete link_path(link)
      end.to change(Link, :count).by(-1)
    end

    it "redirects to the links list" do
      delete link_path(link)
      expect(response).to redirect_to(links_path)
    end
  end
end
