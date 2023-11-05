RSpec.describe Base62 do
  describe ".encode" do
    it { expect(described_class.encode(0)).to eq("0") }
    it { expect(described_class.encode(1)).to eq("1") }
    it { expect(described_class.encode(10)).to eq("a") }
    it { expect(described_class.encode(123)).to eq("1Z") }
    it { expect(described_class.encode(123456789)).to eq("8m0Kx") }

    it "encodes nil to '0'" do
      expect(described_class.encode(nil)).to eq("0")
    end
  end

  describe ".decode" do
    it { expect(described_class.decode("0")).to eq(0) }
    it { expect(described_class.decode("1")).to eq(1) }
    it { expect(described_class.decode("a")).to eq(10) }
    it { expect(described_class.decode("1Z")).to eq(123) }
    it { expect(described_class.decode("8m0Kx")).to eq(123456789) }

    it "decodes empty strings to 0" do
      expect(described_class.decode("")).to eq(0)
    end
  end
end
