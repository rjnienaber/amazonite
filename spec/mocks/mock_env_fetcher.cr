class MockEnvFetcher < Amazonite::Core::Config::Fetcher
  def initialize(@hash : Hash(String, String))
  end

  def []?(key)
    @hash[key]?
  end
end
