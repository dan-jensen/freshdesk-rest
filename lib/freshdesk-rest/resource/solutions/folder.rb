require_relative '../parser'
require_relative '../utils'
require 'uri'

module Freshdesk
  module Rest
    module Resource
      module Solutions
        class Folder
          include Utils

          def initialize(client:)
            @client = client
          end

          def list(category_id:, params: {})
            Parser.parse(@client.get(path_with_params(['/solutions/categories', category_id, 'folders'], params)))
          end
        end
      end
    end
  end
end
