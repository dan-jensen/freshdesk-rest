require_relative '../parser'
require 'uri'

module Freshdesk
  module Rest
    module Resource
      module Solutions
        class Category
          def initialize(client:)
            @client = client
            @path = '/solutions/categories'
          end

          def list(params: {})
            Parser.parse(@client.get([@path, presence(query(params))].compact.join('?')))
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
