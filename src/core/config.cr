module Amazonite::Core
  class Config
    abstract class Fetcher
      abstract def []?(key)
    end

    class EnvFetcher < Fetcher
      def []?(key)
        ENV[key]?
      end
    end

    def initialize(@env : Fetcher = EnvFetcher.new)
    end

    def endpoint_url(service_name)
      @env["AMAZONITE_#{service_name.upcase}_URL"]? || "http://localhost:4566"
    end
  end
end
