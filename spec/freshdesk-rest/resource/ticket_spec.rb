require_relative '../../../lib/freshdesk-rest/resource/ticket'

RSpec.describe Freshdesk::Rest::Resource::Ticket do
  let(:service)       { described_class.new(client: api) }
  let(:resource_type) { described_class.to_s.split('::').last.downcase }
  let(:api)           { double('Api') }
  before              { allow(JSON).to receive(:parse).and_return(result) }
  let(:response)      { double }
  let(:result)        { double }

  describe '#post' do
    before     { allow(api).to receive(:post).with('/tickets', data).and_return(response) }
    let(:data) { double }
    subject    { service.post(data: data) }

    it { is_expected.to eq(result) }
  end
end
