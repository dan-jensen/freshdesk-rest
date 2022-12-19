require_relative '../parser'
require_relative '../utils'
require 'uri'

module Freshdesk
  module Rest
    module Resource
      module Solutions
        class Article
          include Utils

          def initialize(client:)
            @client = client
          end

          def get(id:, language_code: nil, params: {})
            Parser.parse(@client.get(path_with_params(['/solutions/articles', id, language_code], params)))
          end

          def list(folder_id:, language_code: nil, params: {})
            Parser.parse(@client.get(path_with_params(['/solutions/folders', folder_id, 'articles', language_code], params)))
          end

          def search(term:, language_code: nil, params: {})
            Parser.parse(@client.get(path_with_params(['/search/solutions', language_code], params.merge(term: term))))
          end
        end
      end
    end
  end
end
