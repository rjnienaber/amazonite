module Amazonite::Core
  # Lookup seam for environment variables, so `Config`/`IniParser` can be
  # tested against a fake environment instead of the process's real one.
  abstract class Fetcher
    abstract def []?(key)
  end

  # The real `Fetcher`, backed by `ENV`.
  class EnvFetcher < Fetcher
    def []?(key)
      ENV[key]?
    end
  end
end
