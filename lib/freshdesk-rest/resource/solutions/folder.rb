require_relative '../parser'
require 'uri'

module Freshdesk
  module Rest
    module Resource
      module Solutions
        class Folder
          def initialize(client:)
            @client = client
          end

          def list(category_id:, params: {})
            path = ['/solutions/categories', category_id, 'folders'].join('/')
            Parser.parse(@client.get([path, presence(query(params))].compact.join('?')))
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
