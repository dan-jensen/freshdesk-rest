require_relative 'parser'

module Freshdesk
  module Rest
    module Resource
      class Ticket
        def initialize(client:)
          @client = client
          @path = '/tickets'
        end

        def post(data:)
          Parser.parse(@client.post(@path, data))
        end
      end
    end
  end
end
