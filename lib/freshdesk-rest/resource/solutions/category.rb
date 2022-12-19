require_relative '../parser'
require_relative '../utils'
require 'uri'

module Freshdesk
  module Rest
    module Resource
      module Solutions
        class Category
          include Utils

          def initialize(client:)
            @client = client
            @path = '/solutions/categories'
          end

          def list(params: {})
            Parser.parse(@client.get(path_with_params(@path, params)))
          end
        end
      end
    end
  end
end
