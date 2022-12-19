require_relative '../../../../lib/freshdesk-rest/resource/solutions/article'

describe Freshdesk::Rest::Resource::Solutions::Article do
  let(:service)       { described_class.new(client: api) }
  let(:api)           { double('Api') }
  before              { allow(JSON).to receive(:parse).and_return(result) }
  let(:response)      { double }
  let(:result)        { double }

  describe '#get' do
    context 'when passing only the id' do
      before  { allow(api).to receive(:get).with('/solutions/articles/2015007548012').and_return(response) }
      subject { service.get(id: '2015007548012') }

      it { is_expected.to eq(result) }
    end

    context 'when sending the language_code' do
      before  { allow(api).to receive(:get).with('/solutions/articles/2015007548012/en').and_return(response) }
      subject { service.get(id: '2015007548012', language_code: :en) }

      it { is_expected.to eq(result) }
    end
  end

  describe '#list' do
    context 'when passing only folder_id' do
      before  { allow(api).to receive(:get).with('/solutions/folders/2015007548012/articles').and_return(response) }
      subject { service.list(folder_id: '2015007548012') }

      it { is_expected.to eq(result) }
    end

    context 'when sending the language_code' do
      before  { allow(api).to receive(:get).with('/solutions/folders/2015007548012/articles/en').and_return(response) }
      subject { service.list(folder_id: '2015007548012', language_code: :en) }

      it { is_expected.to eq(result) }
    end
  end

  describe '#search' do
    context 'when passing only term' do
      before  { allow(api).to receive(:get).with('/search/solutions?term=abc').and_return(response) }
      subject { service.search(term: 'abc') }

      it { is_expected.to eq(result) }
    end

    context 'when passing term and language code' do
      before  { allow(api).to receive(:get).with('/search/solutions/en?term=abc').and_return(response) }
      subject { service.search(term: 'abc', language_code: :en) }

      it { is_expected.to eq(result) }
    end
  end
end
