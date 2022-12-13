require_relative '../../../../lib/freshdesk-rest/resource/solutions/category'

describe Freshdesk::Rest::Resource::Solutions::Category do
  let(:service)       { described_class.new(client: api) }
  let(:api)           { double('Api') }
  before              { allow(JSON).to receive(:parse).and_return(result) }
  let(:response)      { double }
  let(:result)        { double }


  describe '#list' do
    context 'without params'do
      before  { allow(api).to receive(:get).with('/solutions/categories').and_return(response) }
      subject { service.list }

      it { is_expected.to eq(result) }
    end

    context 'with params'do
      before  { allow(api).to receive(:get).with('/solutions/categories?unique_external_id=123123123').and_return(response) }
      subject { service.list(params: { unique_external_id: '123123123' }) }

      it { is_expected.to eq(result) }
    end
  end
end
