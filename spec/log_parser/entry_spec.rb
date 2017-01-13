require "spec_helper"

describe LogParser::Entry do
  let(:entry) { described_class.new('web/page', '1.2.3.4') }

  it "has a url" do
    expect(entry.url).to eq 'web/page'
  end

  it "has an ip" do
    expect(entry.ip).to eq '1.2.3.4'
  end
end
