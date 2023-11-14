RSpec.describe Event do
  describe "when searching json attributes" do
    context "when searching for a specific value" do
      let!(:event) { create(:event, data: { name: "test", source: "facebook" }) }
      let(:event2) { create(:event, data: { name: "test2", source: "linkedin" }) }

      it "finds the event" do
        expect(Event.where_data(name: "test")).to contain_exactly(event)
      end

      it "finds the event" do
        expect(Event.where_data(name: "test2")).to contain_exactly(event2)
      end
    end

    context "when searching for a specific value in an array" do
      let!(:event) { create(:event, data: { name: "test", source: "facebook" }) }
      let!(:event2) { create(:event, data: { name: "test2", source: "linkedin" }) }

      it "finds the event" do
        expect(Event.where_data(source: %w[facebook linkedin])).to contain_exactly(event, event2)
      end
    end
  end
end
