require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Rails3Enum do
  let!(:conversation) { Conversation.create }

  describe "query state by predicate" do
    before { conversation.archived! }
    it { expect(conversation.active?).to be false }
    it { expect(conversation.archived?).to be true }
  end

  describe "query state with strings" do
    before { conversation.archived! }
    it { expect(conversation.status).to eq "archived" }
  end

  describe "pdate by declaration" do
    it "changed" do
      expect {
        conversation.archived!
      }.to change(conversation, :status).from(nil).to("archived")
    end
  end

  describe "find via scope" do
    let!(:conversation1) { Conversation.create }
    let!(:conversation2) { Conversation.create }
    let!(:conversation3) { Conversation.create }
    before do
      conversation1.archived!
      conversation3.archived!
    end
    it "found records" do
      expect(Conversation.archived).to eq [conversation1, conversation3]
    end
  end

  describe "default value" do
    it { expect(conversation.status).to be_nil }
  end

  describe "direct assignment" do
    it "assign symbol value" do
      conversation.status = :archived
      expect(conversation.archived?).to be true
    end
    it "assign string value" do
      conversation.status = "archived"
      expect(conversation.archived?).to be true
    end
  end

  describe "constant to access the mapping" do
    it { expect(Conversation.statuses[:active]).to eq(0) }
    it { expect(Conversation.statuses["archived"]).to eq(1) }
  end
end
