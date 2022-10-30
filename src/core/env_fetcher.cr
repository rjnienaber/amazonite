module Amazonite::Core
  abstract class Fetcher
    abstract def []?(key)
  end

  class EnvFetcher < Fetcher
    def []?(key)
      ENV[key]?
    end
  end
end
