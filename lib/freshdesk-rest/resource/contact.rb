require_relative 'parser'
require_relative 'utils'
require 'uri'

module Freshdesk
  module Rest
    module Resource
      class Contact
        include Utils

        def initialize(client:)
          @client = client
          @path = '/contacts'
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

        def hard_delete(id:, force: false)
          force_params = force ? { force: true } : {}
          Parser.parse(@client.delete(path_with_params([@path, id, 'hard_delete'], force_params)))
        end
      end
    end
  end
end
