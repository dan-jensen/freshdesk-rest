require_relative '../parser'
require 'uri'

module Freshdesk
  module Rest
    module Resource
      module Solutions
        class Article
          def initialize(client:)
            @client = client
          end

          def get(id:, language_code: nil, params: {})
            path = ['/solutions/articles', id, language_code].compact.join('/')
            Parser.parse(@client.get([path, presence(query(params))].compact.join('?')))
          end

          def list(folder_id:, language_code: nil, params: {})
            path = ['/solutions/folders', folder_id, 'articles', language_code].compact.join('/')
            Parser.parse(@client.get([path, presence(query(params))].compact.join('?')))
          end

          def search(term:, language_code: nil, params: {})
            path = ['/search/solutions', language_code].compact.join('/')
            Parser.parse(@client.get([path, presence(query(params.merge(term: term)))].compact.join('?')))
          end

          private

          def presence(value)
            value.empty? ? nil : value
          end

          def query(params)
            URI.encode_www_form(params.to_a)
          end
        end
      end
    end
  end
end
