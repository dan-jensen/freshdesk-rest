require_relative '../../../../lib/freshdesk-rest/resource/solutions/folder'

describe Freshdesk::Rest::Resource::Solutions::Folder do
  let(:service)       { described_class.new(client: api) }
  let(:api)           { double('Api') }
  before              { allow(JSON).to receive(:parse).and_return(result) }
  let(:response)      { double }
  let(:result)        { double }


  describe '#list' do
    context 'with category id and without params'do
      before  { allow(api).to receive(:get).with('/solutions/categories/123/folders').and_return(response) }
      subject { service.list(category_id: '123') }

      it { is_expected.to eq(result) }
    end

    context 'with category id and with params'do
      before  {
        allow(api).to receive(:get).with('/solutions/categories/123/folders?unique_external_id=34').and_return(response)
      }
      subject { service.list(category_id: '123', params: { unique_external_id: '34' }) }

      it { is_expected.to eq(result) }
    end
  end
end
