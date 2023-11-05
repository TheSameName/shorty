RSpec.describe LinkConfiguration do
  describe "associations" do
    it { is_expected.to belong_to(:link) }
    it { is_expected.to have_one_attached(:image) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:image) }

    describe "#validate_image_type" do
      context "when image content type is not JPEG, PNG or WEBP" do
        let(:link_configuration) { build(:link_configuration, image: fixture_file_upload("sample.txt", "text/plain")) }

        it "is not valid" do
          expect(link_configuration).not_to be_valid
          expect(link_configuration.errors[:image]).to include("must be a JPEG, PNG or WEBP")
        end
      end

      context "when image content type is JPEG, PNG or WEBP" do
        let(:link_configuration) { build(:link_configuration, image: fixture_file_upload("image.jpg", "image/jpeg")) }

        it "is valid" do
          expect(link_configuration).to be_valid
        end
      end
    end

    describe "#validate_image_size" do
      context "when image size is greater than 5MB" do
        let(:link_configuration) { build(:link_configuration, image: fixture_file_upload("10mb.jpg", "image/jpeg")) }

        it "is not valid" do
          expect(link_configuration).not_to be_valid
          expect(link_configuration.errors[:image]).to include("must be less than 5MB")
        end
      end

      context "when image size is less than or equal to 5MB" do
        let(:link_configuration) { build(:link_configuration, image: fixture_file_upload("image.jpg", "image/jpeg")) }

        it "is valid" do
          expect(link_configuration).to be_valid
        end
      end
    end
  end
end
