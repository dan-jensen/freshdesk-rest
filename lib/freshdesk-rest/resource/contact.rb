require_relative 'parser'
require 'uri'

module Freshdesk
  module Rest
    module Resource
      class Contact
        def initialize(client:)
          @client = client
          @path = '/contacts'
        end

        def list(params: {})
          Parser.parse(@client.get([@path, presence(query(params))].compact.join('?')))
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
