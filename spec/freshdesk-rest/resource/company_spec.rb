require_relative '../../../lib/freshdesk-rest/resource/company'

RSpec.describe Freshdesk::Rest::Resource::Company do
  let(:service)       { described_class.new(client: api) }
  let(:resource_type) { described_class.to_s.split('::').last.downcase }
  let(:api)           { double('Api') }
  before              { allow(JSON).to receive(:parse).and_return(result) }
  let(:response)      { double }
  let(:result)        { double }

  describe '#list' do
    context 'without params'do
      before  { allow(api).to receive(:get).with('/companies').and_return(response) }
      subject { service.list }

      it { is_expected.to eq(result) }
    end

    context 'with params'do
      before  { allow(api).to receive(:get).with('/companies?unique_external_id=123123123').and_return(response) }
      subject { service.list(params: { unique_external_id: '123123123' }) }

      it { is_expected.to eq(result) }
    end
  end

  describe '#get' do
    before  { allow(api).to receive(:get).with('/companies/2015007548012').and_return(response) }
    subject { service.get(id: '2015007548012') }

    it { is_expected.to eq(result) }
  end

  describe '#post' do
    before     { allow(api).to receive(:post).with('/companies', data).and_return(response) }
    let(:data) { double }
    subject    { service.post(data: data) }

    it { is_expected.to eq(result) }
  end

  describe '#put' do
    before     { allow(api).to receive(:put).with('/companies/2015007548012', data).and_return(response) }
    let(:data) { double }
    subject    { service.put(id: '2015007548012', data: data) }

    it { is_expected.to eq(result) }
  end

  describe '#delete' do
    before  { allow(api).to receive(:delete).with('/companies/2015007548012').and_return(response) }
    subject { service.delete(id: '2015007548012') }

    it { is_expected.to eq(result) }
  end
end
