module Amazonite::Core
  # Tries each `CredentialsProvider` in order and returns the first
  # non-`nil` result.
  class CredentialsProviderChain
    def initialize(@providers : Array(CredentialsProvider))
    end

    def credentials : Credentials?
      @providers.each do |provider|
        creds = provider.credentials
        return creds if creds
      end
      nil
    end
  end
end
