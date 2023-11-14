RSpec.shared_examples Event do |event|
  describe "associations" do
    it { is_expected.to belong_to(:owner).optional }
  end

  describe "validations" do
    subject { build(event) }

    it { is_expected.to validate_presence_of :type }
    it { is_expected.to validate_presence_of :data }
  end

  describe "factories" do
    it "builds properly" do
      expect(build(event)).to be_valid
    end

    it "creates properly" do
      expect { create(event) }.not_to raise_error
    end
  end
end
