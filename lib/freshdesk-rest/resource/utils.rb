module Freshdesk
  module Rest
    module Resource
      module Utils
        def presence(value)
          value.empty? ? nil : value
        end

        def query(params)
          URI.encode_www_form(params.to_a)
        end

        def path_with_params(path, params = {})
          path = path.compact.join('/') if path.is_a?(Array)
          [path, presence(query(params))].compact.join('?')
        end
      end
    end
  end
end
