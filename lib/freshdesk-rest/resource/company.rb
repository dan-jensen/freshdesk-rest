require_relative 'parser'
require_relative 'utils'
require 'uri'

module Freshdesk
  module Rest
    module Resource
      class Company
        include Utils

        def initialize(client:)
          @client = client
          @path = '/companies'
        end

        def list(params: {})
          Parser.parse(@client.get(path_with_params(@path, params)))
        end

        def get(id:)
          Parser.parse(@client.get("#{@path}/#{id}"))
        end

        def post(data:)
          Parser.parse(@client.post(@path, data))
        end

        def put(id:, data:)
          Parser.parse(@client.put("#{@path}/#{id}", data))
        end

        def delete(id:)
          Parser.parse(@client.delete("#{@path}/#{id}"))
        end
      end
    end
  end
end
