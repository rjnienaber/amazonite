module Amazonite::Core
  abstract class CredentialsProvider
    # returns nil when this provider's prerequisite configuration isn't
    # present, so the chain falls through to the next provider
    abstract def credentials : Credentials?
  end
end
