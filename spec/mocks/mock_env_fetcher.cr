# TODO: should be using interfaces
class MockEnvFetcher < Amazonite::Core::Fetcher
  def initialize(@hash : Hash(String, String))
  end

  def []?(key)
    @hash[key]?
  end
end
