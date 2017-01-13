require "spec_helper"

describe LogParser::Parser do
  let(:e1) { LogParser::Entry.new('web/page', '1.2.3.4') }
  let(:e2) { LogParser::Entry.new('web/page', '1.2.3.4') }
  let(:e3) { LogParser::Entry.new('web/page', '1.2.3.4.5') }
  let(:e4) { LogParser::Entry.new('web/page2', '1.2.3.4') }
  let(:parser) { described_class.new([e1, e2, e3, e4]) }

  describe '#order_by_most_views' do
    subject { parser.order_by_most_views }

    it "should order by most views" do
      expect(subject).to eq [['web/page', 3], ['web/page2', 1]]
    end
  end

  describe '#order_by_most_unique_views' do
    subject { parser.order_by_most_unique_views }

    it "should order by most unique views" do
      expect(subject).to eq [['web/page', 2], ['web/page2', 1]]
    end
  end

  describe '.from_file' do
    subject { described_class.from_file('spec/fixtures/test.log') }

    it "should return a parser instance with entries" do
      expect(subject).to be_a described_class
      expect(subject.entries.count).to eq 4
    end
  end

  describe '.from_array' do
    let(:e1) { 'web/page 1.2.3.4' }
    let(:e2) { 'web/page 1.2.3.4' }
    let(:e3) { 'web/page2 1.2.3.4' }
    subject { described_class.from_array([e1, e2, e3]) }

    it "should return a parser instance with entries" do
      expect(subject).to be_a described_class
      expect(subject.entries.count).to eq 3
    end
  end
end
